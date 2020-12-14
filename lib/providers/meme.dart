
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

  Map<String,dynamic> toMap() => {
    "id" : id,
    "photo" : {
      "name" : photo.name,
      "url" : photo.url,
    },
    "topText" : topText,
    "bottomText" : bottomText,
    "memeTextStyle" : {
      "align":memeTextStyle.align.toString(),
      "color" : memeTextStyle.color.value,
      "fontFamily":memeTextStyle.fontFamily,
      "weight":memeTextStyle.weight.toString(),
      "maxFontSize":memeTextStyle.maxFontSize,
    },
  };

}