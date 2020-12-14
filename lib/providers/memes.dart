
import 'package:flutter/material.dart';
import 'package:memix/models/network_ex.dart';
import 'package:memix/widgets/consts.dart';
import '../database/database.dart';
import 'meme.dart';

class Memes with ChangeNotifier{

  List<Meme> _memes = [];

  List<Meme> get memes => [..._memes];

  final consts = Consts();
  Future<void> addMeme(Meme meme,BuildContext context) async {
    try{
      showDialog(context: context,builder: (context) => consts.getLoadingDialog(context, 'Sharing...'));
      await Database().addMeme(meme);
      _memes.add(meme);
      notifyListeners();
      Navigator.of(context).pop();
    }catch(e){
      Navigator.of(context).pop();
      throw NetworkEx(e);
    }
  }

}