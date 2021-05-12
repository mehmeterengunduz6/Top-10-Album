import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:spotify_my_top_10_songs/constants.dart';
import 'package:spotify_my_top_10_songs/screens/home_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'My Top Albums',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      image: Image.asset('assets/images/red.png'),
      gradientBackground: LinearGradient(
        colors: [
          kScaffold1,
          kScaffold2,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 120.0,
      loaderColor: Colors.red,
    );
  }
}
