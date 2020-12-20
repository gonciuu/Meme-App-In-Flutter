
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../providers/auth.dart';
import '../models/network_ex.dart';
import '../widgets/consts.dart';
import '../database/database.dart';
import './meme.dart';

class Memes with ChangeNotifier{

  final _auth = Auth();

  List<Meme> _memes = [];

  List<Meme> get memes => [..._memes];

  final consts = Consts();
  final database = Database();

  Future<void> addMeme(Meme meme,BuildContext context) async {
    try{
      showDialog(context: context,builder: (context) => consts.getLoadingDialog(context, 'Sharing...'));
      final Response response = await database.addMeme(meme);
      meme.id = json.decode(response.body)['name'];
      _memes.add(meme);
      notifyListeners();
      Navigator.of(context).pop();
    }catch(e){
      Navigator.of(context).pop();
      throw NetworkEx(e);
    }
  }

  Future<void> fetchMemes() async{
    try{
      Response response = await database.fetchMemes();
      final data = json.decode(response.body) as Map<String, dynamic>;
      _memes.clear();
      if(data !=null && data.length>0)
        data.forEach((memeId, memeData) => _memes.add(Meme().fromMap(memeData,memeId)));
      notifyListeners();
    }catch(e){
      throw e;
    }
  }


  List<Meme> get likedMemes  => _memes.where((meme) => meme.usersLiked.contains(_auth.uid)).toList();
  int get likedMemesCount => _memes.where((meme) => meme.usersLiked.contains(_auth.uid)).toList().length;


  void refreshState() => notifyListeners();




}