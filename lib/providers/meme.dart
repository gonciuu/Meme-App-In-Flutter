import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/meme_text.dart';
import '../models/photo.dart';

class Meme with ChangeNotifier {
  String id;
  Photo photo;
  String topText;
  String bottomText;
  MemeText memeTextStyle = MemeText();


  Meme({this.id, this.bottomText, this.topText, this.photo, this.memeTextStyle});

  Map<String, dynamic> toMap() => {
        "photo": {
          "name": photo.name,
          "url": photo.url,
        },
        "topText": topText,
        "bottomText": bottomText,
        "memeTextStyle": {
          "align": memeTextStyle.align.toString(),
          "color": memeTextStyle.color.value,
          "fontFamily": memeTextStyle.fontFamily,
          "weight": memeTextStyle.weight.toString(),
          "maxFontSize": memeTextStyle.maxFontSize,
        },
      };

  Meme fromMap(Map<String, dynamic> map, String memeId) => Meme(
      id: memeId,
      bottomText: map['bottomText'],
      topText: map['topText'],
      photo: Photo(map['photo']['name'], map['photo']['url']),
      memeTextStyle: MemeText(
          align: textAlignFromString(map['memeTextStyle']['align']),
          color: Color(map['memeTextStyle']['color']),
          fontFamily: map['memeTextStyle']['fontFamily'],
          maxFontSize: map['memeTextStyle']['maxFontSize'],
          weight: textWeightFromString(map['memeTextStyle']['weight'])));

  TextAlign textAlignFromString(String textAlignText) {
    switch (textAlignText) {
      case "TextAlign.center":
        return TextAlign.center;
        break;
      case "TextAlign.left":
        return TextAlign.left;
        break;
      case "TextAlign.right":
        return TextAlign.right;
        break;
      default:
        return TextAlign.center;
    }
  }

  FontWeight textWeightFromString(String textWeight) {
    switch (textWeight) {
      case "FontWeight.w900":
        return FontWeight.w900;
        break;
      case "FontWeight.w500":
        return FontWeight.w500;
        break;
      case "FontWeight.w300":
        return FontWeight.w300;
        break;
      default:
        return FontWeight.w900;
    }
  }
}
