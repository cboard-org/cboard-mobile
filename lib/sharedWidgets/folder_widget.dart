import 'package:cboard_mobile/models/data/data.dart';
// import 'package:cboard_mobile/data/mockData.dart';
import 'package:cboard_mobile/UI/locked/screens/home_screen.dart';
import 'package:cboard_mobile/providers/unlocked/unlocked_home_provider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FolderWidget extends StatelessWidget {

  final TileModel folderModel;

  // //Label name
  // final String text;
  //
  // //Main content, either Image or Text
  // final String content;
  //
  // //Background color
  // final Color color;

  //Label color
  // final Color labelColor;
  final Function tapped;
  final Function longPressed;
  //Label Position, either top or bottom
  // final bool labelPos;

  // final List<TileData> tiles;
  final String folderId;

  const FolderWidget(
      {Key key,
        this.folderModel,
        // this.text,
        // this.content,
        // this.color,
        this.tapped,
        this.longPressed,
        // this.labelPos,
        // this.tiles,
        // this.labelColor,
        this.folderId
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      //Symbol image
      Expanded(
        flex: 3,
        child: Container(
          //Use suitable image renderer depending on image types
          child: folderModel.image.endsWith("svg")
              ? SvgPicture.asset("assets" + folderModel.image)
              : Image.asset("assets" + folderModel.image),
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
            folderModel.labelKey.split('.').last,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ];

    return Consumer<UnlockedHomeProvider>(
      builder: (context, unlockedHomeProvider, child) {
        return GestureDetector(
          onTap: tapped,
          onLongPress: longPressed,
          child: Container(
            child: Card(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SvgPicture.asset(
                    'assets/images/folder-tile.svg',
                    color: folderModel.backgroundColor,
                  ),
                  Container(
                    height: 100,
                    child: Column(
                      children: children,
                      // labelPos
                      // ? [children[1], children[0]]
                      // : [children[0], children[1]],
                    ),
                  ),
              if (unlockedHomeProvider.selectMode &&
                          unlockedHomeProvider.selectList.containsKey(folderModel.labelKey))
                        Container(
                          color: Colors.black26,
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.check_circle,
                                color: paua,
                              )),
                        ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
