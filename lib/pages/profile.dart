import 'package:flutter/material.dart';
import 'package:flutter_application_social_mobile/widgets/header.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(titleText: "Profile"),
    );
  }
}
