import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:memix/models/network_ex.dart';
import '../models/meme_text.dart';
import '../models/photo.dart';

class Meme with ChangeNotifier {
  String id;
  Photo photo;
  String topText;
  String bottomText;
  MemeText memeTextStyle = MemeText();
  List<String> usersLiked;
  int time;

  Meme(
      {this.id,
      this.bottomText,
      this.topText,
      this.photo,
      this.memeTextStyle,
      this.usersLiked,
      this.time});

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
        "usersLiked": usersLiked,
        "time": time
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
          weight: textWeightFromString(map['memeTextStyle']['weight'])),
      usersLiked: map['usersLiked'] == null
          ? []
          : (map['usersLiked'] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
  time: map['time']);

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

  bool checkMemeFav(String userId) => usersLiked.contains(userId);

  Future<void> toggleFavourite(String userId) async {
    final bool isAdd = usersLiked.contains(userId);
    isAdd ? usersLiked.remove(userId) : usersLiked.add(userId);
    try {
      final url =
          'https://shop-app-3a54e-default-rtdb.firebaseio.com/memes/$id.json';
      final result =
          await patch(url, body: json.encode({"usersLiked": usersLiked}));
      print(result.statusCode);
      if (result.statusCode >= 400)
        handleEx(isAdd, userId, Exception("Firebase error handled"));
      notifyListeners();
    } catch (e) {
      handleEx(isAdd, userId, e);
    }
  }

  void handleEx(bool isAdd, String userId, Exception e) {
    isAdd ? usersLiked.add(userId) : usersLiked.remove(userId);
    notifyListeners();
    throw NetworkEx(e);
  }
}
