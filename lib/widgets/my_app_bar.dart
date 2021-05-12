import 'package:flutter/material.dart';
import 'package:spotify_my_top_10_songs/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      width: double.infinity,
      height: height * .1,
      child: Center(
        child: Text(
          'My Top Albums',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
