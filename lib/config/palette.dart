import 'package:flutter/material.dart';

class Palette {

  //my fav
  static const Color po1 = Color(0xFF3E8E7E);
  static const Color po2 = Color(0xFF7CD1B8);
  static const Color po3 = Color(0xFFFABB51);
  static const Color po4 = Color(0xFFFAEDC6);
  static const Color textNo = Color(0xFF000000);


  // gradient color


  static const LinearGradient gradientPattren = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
  static const LinearGradient greenGra = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Palette.po1,
        Palette.po2,
      ]);
}
