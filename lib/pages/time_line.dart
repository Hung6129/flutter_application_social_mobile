import 'package:flutter/material.dart';
import 'package:flutter_application_social_mobile/widgets/header.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        isAppTitle: true,
      ),
    );
  }
}
