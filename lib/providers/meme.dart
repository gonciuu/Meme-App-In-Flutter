
import 'package:flutter/material.dart';
import '../models/meme_text.dart';
import '../models/photo.dart';

class Meme with ChangeNotifier{

  final String id;
  Photo photo;
  String topText;
  String bottomText;
  MemeText memeTextStyle = MemeText();
  Meme({this.id,this.bottomText,this.topText,this.photo,this.memeTextStyle});


}