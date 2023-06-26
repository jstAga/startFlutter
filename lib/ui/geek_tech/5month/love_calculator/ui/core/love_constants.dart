import 'package:flutter/material.dart';

class LoveConstants {
  static const Color pink = Color.fromRGBO(240, 184, 210, 1);

  static final baseLoveButton = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    backgroundColor: MaterialStateProperty.all(pink),
    padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 40)),
  );

  static const baseTitleText =
      TextStyle(color: pink, fontSize: 28, fontWeight: FontWeight.bold);

  static const baseHomeText =
      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400);

  static const baseResultText =
      TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w300);
}
