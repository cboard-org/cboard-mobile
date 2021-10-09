import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/lockedScreen/screens/home_screen.dart';
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
  final Function tapped;
  //Label Position, either top or bottom
  final bool labelPos;
  final List<TileData> tiles;

  const FolderTile(
      {Key key,
      this.text,
      this.content,
      this.color,
      this.tapped,
      this.labelPos,
      this.tiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  data: tiles,
                )),
      ),
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Icon(
              Icons.folder,
              color: soft_orange,
              size: 130,
            ),
            // ColorFiltered(
            //   child: Image.asset('assets/images/folder-tile.png'),
            //   colorFilter: ColorFilter.mode(soft_orange, BlendMode.color),
            // ),
            Container(
              height: 100,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: SvgPicture.asset(content),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
