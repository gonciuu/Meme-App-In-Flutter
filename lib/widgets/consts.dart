import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Consts {
  final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.white, width: 1.0));

  SnackBar getSnackBar(String content) {
    return SnackBar(
      backgroundColor: Color.fromARGB(255, 25, 23, 32),
      duration: Duration(seconds: 3),
      content: Text(content,maxLines: 3, overflow: TextOverflow.ellipsis,softWrap: true,),
    );
  }
}
