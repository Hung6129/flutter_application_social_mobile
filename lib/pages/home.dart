import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_social_mobile/config/palette.dart';
import 'package:flutter_application_social_mobile/pages/activity_feed.dart';
import 'package:flutter_application_social_mobile/pages/profile.dart';
import 'package:flutter_application_social_mobile/pages/search.dart';
import 'package:flutter_application_social_mobile/pages/time_line.dart';
import 'package:flutter_application_social_mobile/pages/upload.dart';
import 'package:flutter_application_social_mobile/widgets/app_text.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn ggSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    ggSignIn.onCurrentUserChanged.listen((account) {
      handeleSignIn(account);
    }, onError: (err) {
      print("Error signing in: $err");
    });

    ggSignIn
        .signInSilently(suppressErrors: false)
        .then((account) => handeleSignIn(account))
        .catchError((onError) {
      print("Error signing in: $onError");
    });
  }

  handeleSignIn(account) {
    if (account != null) {
      print("User signed in!: $account");
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  login() {
    ggSignIn.signIn();
  }

  logout() {
    ggSignIn.signOut();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.linearToEaseOut,
    );
  }

  Scaffold buildAutScreen() {
    return Scaffold(
      body: PageView(
        children: [
          TimeLine(),
          UpLoad(),
          Search(),
          Profile(),
          Activity(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Palette.po4,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
          ),
        ],
        currentIndex: pageIndex,
        onTap: onTap,
        inactiveColor: Palette.po2,
        activeColor: Palette.po1,
      ),
    );
  }

  buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: Palette.greenGra,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              text: "Social Mobile",
              color: Palette.po4,
              size: 30,
              fontWeight: FontWeight.bold,
            ),
            SignInButtonBuilder(
              text: 'Sign in with Google',
              textColor: Palette.po4,
              onPressed: () => login(),
              backgroundColor: Palette.po1,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAutScreen() : buildUnAuthScreen();
  }
}
