import 'package:flutter/material.dart';

import '/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  Color color;
  String? text;
  IconData? icon;
  Color bgColor;
  double size;

  Color borderColor;
  bool isIcon;

  AppButton({
    Key? key,
    required this.color,
    this.text,
    this.icon,
    required this.bgColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: isIcon == false
          ? Center(
        child: AppText(
          text: text!,
          color: color,
          fontWeight: FontWeight.w400,
          size: 20,
        ),
      )
          : Center(
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}