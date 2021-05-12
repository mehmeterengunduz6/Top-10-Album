import 'package:flutter/material.dart';
import 'package:spotify_my_top_10_songs/constants.dart';
import 'package:spotify_my_top_10_songs/widgets/gradient_text.dart';
import 'package:spotify_my_top_10_songs/widgets/my_app_bar.dart';
import 'package:spotify_my_top_10_songs/widgets/my_form_field.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController myController = TextEditingController();
  String username;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kScaffold1,
                  kScaffold2,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyAppBar(height: height),
                Container(
                  padding: EdgeInsets.symmetric(vertical: height * .01),
                  child: Image.asset('assets/images/red.png'),
                ),
                MyFormField(
                    width: width, myController: myController, height: height),
                SizedBox(height: height * .045),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'For your feedbacks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: _launchInsta,
                        child: GradientText(
                          'erengunnduz',
                          gradient: LinearGradient(
                            colors: [
                              Color(0xfffeda75),
                              Color(0xfffa7e1e),
                              Color(0xffd62976),
                              Color(0xff962fbf),
                              Color(0xff4f5bd5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchInsta() async {
    const url = 'https://instagram.com/erengunnduz/';
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      print('çalışmadı');
    }
  }
}
