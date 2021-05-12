import 'package:flutter/material.dart';
import 'package:spotify_my_top_10_songs/constants.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_my_top_10_songs/widgets/album_card.dart';
import 'package:spotify_my_top_10_songs/widgets/album_summary_card.dart';
import 'package:spotify_my_top_10_songs/widgets/gradient_text.dart';
import 'package:spotify_my_top_10_songs/widgets/my_app_bar.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class AlbumScreen extends StatefulWidget {
  final String username;
  AlbumScreen({this.username});

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<String> images = [];
  List<String> names = [];
  List<String> ranks = [];
  List<String> counts = [];
  var albumData;
  var imageExtraLarge;
  var albumName;
  var albumPlaycount;
  var albumRank;

  Future<void> getAlbumImage() async {
    albumData = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=${widget.username}&api_key=25f67164d87aaab7ebd64c6a9e88b63d&format=json&limit=10'));
    var albumDataParsed = jsonDecode(albumData.body);
    images.clear();
    for (var i = 0; i < 10; i++) {
      images.add(albumDataParsed['topalbums']['album'][i]['image'][3]['#text']);
      setState(() {});
    }
  }

  Future<void> getAlbumName() async {
    albumData = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=${widget.username}&api_key=25f67164d87aaab7ebd64c6a9e88b63d&format=json&limit=10'));
    var albumDataParsed = jsonDecode(utf8.decode(albumData.bodyBytes));
    names.clear();
    for (var i = 0; i < 10; i++) {
      names.add(albumDataParsed['topalbums']['album'][i]['name']);
      setState(() {});
    }
  }

  Future<void> getAlbumPlaycount() async {
    albumData = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=${widget.username}&api_key=25f67164d87aaab7ebd64c6a9e88b63d&format=json&limit=10'));
    var albumDataParsed = jsonDecode(albumData.body);
    counts.clear();
    for (var i = 0; i < 10; i++) {
      counts.add(albumDataParsed['topalbums']['album'][i]['playcount']);
      setState(() {});
    }
  }

  Future<void> getAlbumRank() async {
    albumData = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=${widget.username}&api_key=25f67164d87aaab7ebd64c6a9e88b63d&format=json&limit=10'));
    var albumDataParsed = jsonDecode(albumData.body);
    ranks.clear();
    for (var i = 0; i < 10; i++) {
      ranks.add(albumDataParsed['topalbums']['album'][i]['@attr']['rank']);
      setState(() {});
    }
  }

  void getAlbumData() async {
    await getAlbumImage();
    await getAlbumName();
    getAlbumPlaycount();
    getAlbumRank();
  }

  @override
  void initState() {
    super.initState();
    getAlbumData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
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
              SizedBox(height: 25),
              FutureBuilder(
                  future: http.get(Uri.parse(
                      'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=${widget.username}&api_key=25f67164d87aaab7ebd64c6a9e88b63d&format=json&limit=10')),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Expanded(
                        child: ListView.builder(
                          physics: PageScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (_, int index) {
                            return AlbumCard(
                              imageExtraLarge: images[index],
                              albumName: names[index],
                              albumRank: ranks[index],
                              albumPlaycount: counts[index],
                            );
                          },
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kSpotifyColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(
                            color: kSpotifyColor,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width * .22,
                      height: height * .065,
                      child: Center(
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kRedColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(
                            color: kRedColor,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: setupAlertDialoadContainer(),
                            );
                          });
                    },
                    child: Container(
                      width: width * .22,
                      height: height * .065,
                      child: Center(
                        child: Text(
                          'Summary',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
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
    );
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (_, int index) {
          return AlbumSummaryCard(
            imageExtraLarge: images[index],
            albumName: names[index],
            albumRank: ranks[index],
            albumPlaycount: counts[index],
          );
        },
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
