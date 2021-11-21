import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/providers/unlocked/unlocked_home_provider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TileWidget extends StatelessWidget {

  final TileModel tileModel;
  final Function tapped;
  final Function longPressed;
  //Label name
  // final String text;
  //
  // //Main content, either Image or Text
  // final String content;
  //
  // //Background color
  // final Color color;
  //
  // //Label color
  // final Color labelColor;



  //Label Position, either top or bottom
  // final bool labelPos;

  //Check if tile is for adding text or not
  // final bool edittingTile;

  const TileWidget({
    Key key,
    this.tileModel,
    // this.content,
    // this.text,
    // this.color,
    this.tapped,
    this.longPressed,
    // this.labelPos,
    // this.edittingTile = false,
    // this.labelColor,
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
          // child: edittingTile ? Text(content) : SvgPicture.asset(content),
          child: tileModel.image.endsWith("svg")
              ? SvgPicture.asset("assets" + tileModel.image)
              : Image.asset("assets" + tileModel.image),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          color: white,
          child: Text(
            tileModel.labelKey.split(".").last,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ];

    return Consumer<UnlockedHomeProvider>(
      builder: (context, unlockedHomeProvider, child) {
        return GestureDetector(
          onTap: tapped,
          onLongPress: longPressed,
          child: Stack(
            children: [Card(
              elevation: 2,
              color: tileModel.backgroundColor,
              child: Column(
                children: items
                // labelPos ? [items[1], items[0]] : [items[0], items[1]],
              ),
            ),
            if (unlockedHomeProvider.selectMode &&
                      unlockedHomeProvider.selectList.containsKey(tileModel.labelKey))
                    Container(
                      color: Colors.black26,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.check_circle,
                            color: paua,
                          )),
                    ),
          ]
          ),
        );
      }
    );
  }
}
