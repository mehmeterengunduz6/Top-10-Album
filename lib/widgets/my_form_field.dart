import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:spotify_my_top_10_songs/constants.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_my_top_10_songs/screens/album_screen.dart';
import 'package:spotify_my_top_10_songs/widgets/alert_dialogs.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    Key key,
    @required this.width,
    @required this.myController,
    @required this.height,
  }) : super(key: key);

  final double width;
  final TextEditingController myController;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * .08),
          child: TextFormField(
            controller: myController,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 32,
                  height: 32,
                  child: Image.asset(
                    'assets/images/lastfmsquare.png',
                    color: Colors.red,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kSpotifyColor,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              labelText: 'Your last.fm username',
              fillColor: Colors.white.withOpacity(0.1),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: height * .05),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kSpotifyColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
                side: BorderSide(
                  color: kSpotifyColor,
                ),
              ),
            ),
          ),
          onPressed: () async {
            var response = await http.get(Uri.parse(
                'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=${myController.text}&api_key=25f67164d87aaab7ebd64c6a9e88b63d&format=json&limit=10'));
            if (jsonDecode(response.body)['message'] ==
                'Operation failed - Most likely the backend service failed. Please try again.') {
              showAlertDialog(context);
            } else if (jsonDecode(response.body)['message'] ==
                'User not found') {
              showAlertDialog(context);
            } else if (jsonDecode(response.body)['topalbums']['album']
                .isEmpty) {
              showMyAlertDialog(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AlbumScreen(username: myController.text)),
              );
            }
          },
          child: Container(
            width: width * .5,
            height: height * .065,
            child: Center(
              child: Text(
                'Connect',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: height * .03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'thanks to',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/lastfm.png',
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
