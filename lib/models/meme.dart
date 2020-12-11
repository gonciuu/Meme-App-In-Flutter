
import 'package:flutter/material.dart';
import 'meme_text.dart';
import 'photo.dart';

class Meme{

  final String id;
  Photo photo;
  MemeText topText = MemeText();
  MemeText bottomText = MemeText();
  Meme({this.id,this.bottomText,this.photo,this.topText});


}