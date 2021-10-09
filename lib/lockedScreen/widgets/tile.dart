import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TileWidget extends StatelessWidget {
  //Label name
  final String text;
  //Main content, either Image or Text
  final String content;
  //Background color
  final Color color;
  final Function tapped;
  //Label Position, either top or bottom
  final bool labelPos;
  //Check if tile is for adding text or not
  final bool edittingTile;

  const TileWidget({
    Key key,
    this.content,
    this.text,
    this.color,
    this.tapped,
    this.labelPos,
    this.edittingTile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      Expanded(
        //Main content will take up the most space
        flex: 3,
        child: Container(
          padding: EdgeInsets.all(5),
          //If tile is for adding text, put text as main content else put image
          child: edittingTile ? Text(content) : SvgPicture.asset(content),
          // Image.asset(content),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          color: white,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ];

    return GestureDetector(
      //If tile is tapped, tile will be added to SentenceBar.words and show in the sentence bar
      onTap: tapped,
      child: Card(
        elevation: 2,
        color: color,
        child: Column(
          children: labelPos ? [items[1], items[0]] : [items[0], items[1]],
        ),
      ),
    );
  }
}