import 'package:flutter/material.dart';
import 'package:flutter_application_social_mobile/config/palette.dart';
import 'package:flutter_application_social_mobile/widgets/app_text.dart';

AppBar header({bool isAppTitle = false, String titleText = ""}) {
  return AppBar(
    title: AppText(
      text: isAppTitle ? "Social Mobile" : titleText,
      color: Palette.po4,
      size: isAppTitle ? 30 : 25,
      fontWeight: isAppTitle ? FontWeight.bold : FontWeight.normal,
    ),
    centerTitle: true,
    backgroundColor: Palette.po2,
  );
}
