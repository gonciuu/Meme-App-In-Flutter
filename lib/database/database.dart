import 'dart:convert';
import 'package:http/http.dart';
import '../providers/meme.dart';

class Database{

  static const url = "https://shop-app-3a54e-default-rtdb.firebaseio.com/memes.json";
  Future<Response> addMeme(Meme meme) async => await post(url,body: json.encode(meme.toMap()));
  Future<Response> fetchMemes() async => await get(url);

}