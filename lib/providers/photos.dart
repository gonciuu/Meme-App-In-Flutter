import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:memix/models/network_ex.dart';
import '../models/photo.dart';

class Photos with ChangeNotifier{

  final List<Photo> _photosList = [];


  List<Photo> get photos => [..._photosList];


  Future getPhotosFromWeb() async{
    try{
      final Response response = await get('https://api.memegen.link/templates');
      List<dynamic> result = json.decode(response.body) as List<dynamic>;
      _photosList.clear();
      result.forEach((photoMap) => photoMap['lines'] ==2 ? _photosList.add(Photo(photoMap['name'], photoMap['blank'])):null);
      notifyListeners();
    }catch(e){throw NetworkEx(e);}
  }


}