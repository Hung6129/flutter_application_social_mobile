import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  String text;
  Color color;
  FontWeight fontWeight;
  double size;

  AppText({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.mcLaren(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
