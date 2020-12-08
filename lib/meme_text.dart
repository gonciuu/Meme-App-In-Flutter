import 'package:flutter/material.dart';

class MemeText {
  String text;
  FontWeight weight;
  TextAlign align;
  Color color;
  int maxFontSize;

  MemeText(
      {this.text = "",
      this.align = TextAlign.center,
      this.color = Colors.grey,
      this.maxFontSize = 40,
      this.weight = FontWeight.w700});
}
