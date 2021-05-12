import 'package:flutter/material.dart';

class AlbumSummaryCard extends StatelessWidget {
  final String albumName;
  final String imageExtraLarge;
  final String albumPlaycount;
  final String albumRank;

  const AlbumSummaryCard(
      {Key key,
      this.albumName,
      this.imageExtraLarge,
      this.albumPlaycount,
      this.albumRank})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                albumRank,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                child: Image.network(
                  imageExtraLarge,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Text(
                  albumName,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          Text(albumPlaycount),
        ],
      ),
    );
  }
}
