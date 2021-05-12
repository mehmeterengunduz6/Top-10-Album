import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final String albumName;
  final String imageExtraLarge;
  final String albumPlaycount;
  final String albumRank;

  const AlbumCard(
      {Key key,
      this.albumName,
      this.imageExtraLarge,
      this.albumPlaycount,
      this.albumRank})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.network(
                imageExtraLarge,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  albumName,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  'Sıralama: $albumRank',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  'Dinleme Sayın: $albumPlaycount',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
