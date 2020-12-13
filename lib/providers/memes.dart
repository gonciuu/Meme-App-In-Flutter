
import 'package:flutter/material.dart';
import 'meme.dart';

class Memes with ChangeNotifier{

  List<Meme> _memes = [];

  List<Meme> get memes => [..._memes];

  void addMeme(Meme meme){
    _memes.add(meme);
    notifyListeners();
    print(_memes);
  }

}