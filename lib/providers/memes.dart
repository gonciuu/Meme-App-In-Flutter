
import 'package:flutter/material.dart';
import '../database/database.dart';
import 'meme.dart';

class Memes with ChangeNotifier{

  List<Meme> _memes = [];

  List<Meme> get memes => [..._memes];

  Future<void> addMeme(Meme meme) async {
    Database().addMeme(meme);
    _memes.add(meme);
    notifyListeners();
    print(_memes);
  }

}