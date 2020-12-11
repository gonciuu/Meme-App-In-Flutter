
import 'package:flutter/material.dart';
import '../models/meme_text.dart';
import '../models/photo.dart';

class Meme{

  final String id;
  Photo photo;
  MemeText topText = MemeText();
  MemeText bottomText = MemeText();
  Meme({this.id,this.bottomText,this.photo,this.topText});


}