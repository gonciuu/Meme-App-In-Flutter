import 'package:flutter/material.dart';

class MemeText {
  String text;
  String fontFamily;
  FontWeight weight;
  TextAlign align;
  Color color;
  int maxFontSize;

  MemeText(
      {this.text = "",
      this.align = TextAlign.center,
      this.color = const Color(0xff343434),
      this.maxFontSize = 40,
      this.fontFamily = 'Lato',
      this.weight = FontWeight.w500});
}
