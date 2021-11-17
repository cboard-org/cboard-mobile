import 'package:cboard_mobile/UI/lockedScreen/data.dart';
// import 'package:cboard_mobile/data/mockData.dart';
import 'package:cboard_mobile/UI/lockedScreen/screens/home_screen.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FolderTile extends StatelessWidget {
  //Label name
  final String text;

  //Main content, either Image or Text
  final String content;

  //Background color
  final Color color;

  //Label color
  final Color labelColor;
  final Function tapped;

  //Label Position, either top or bottom
  final bool labelPos;

  // final List<TileData> tiles;
  final String folderId;

  const FolderTile(
      {Key key,
      this.text,
      this.content,
      this.color,
      this.tapped,
      this.labelPos,
      // this.tiles,
      this.labelColor,
      this.folderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      //Symbol image
      Expanded(
        flex: 3,
        child: Container(
          //Use suitable image renderer depending on image types
          child: content.endsWith("svg")
              ? SvgPicture.asset(content)
              : Image.asset(content),
        ),
      ),
      //Tile layout
      Expanded(
        flex: 1,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          color: white,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: labelColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ];

    //If chosen, redener HomeScreen with tiles in folder
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  data: defaultBoards,
                  folderId: folderId,
                )),
      ),
      child: Container(
        child: Card(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.asset(
                'assets/images/folder-tile.svg',
                color: color,
              ),
              Container(
                height: 100,
                child: Column(
                  children: labelPos
                      ? [children[1], children[0]]
                      : [children[0], children[1]],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
