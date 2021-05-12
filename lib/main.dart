import 'package:flutter/material.dart';
import 'package:spotify_my_top_10_songs/constants.dart';
import 'package:spotify_my_top_10_songs/screens/splash_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kSpotifyColor,
        fontFamily: 'VarelaRound',
      ),
      home: Splash(),
    );
  }
}
