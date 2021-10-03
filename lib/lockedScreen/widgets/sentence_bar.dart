// import 'package:cboard_mobile/data/mockData.dart';
import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/lockedScreen/widgets/textTile.dart';
import 'package:cboard_mobile/lockedScreen/widgets/tile.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:cboard_mobile/models/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SentenceBar extends StatefulWidget {
  final Function() tapped;

  const SentenceBar({Key key, this.tapped}) : super(key: key);

  @override
  _SentenceBarState createState() => _SentenceBarState();
}

class _SentenceBarState extends State<SentenceBar> {
  @override
  Widget build(BuildContext context) {
    final dialogModel = Provider.of<DialogModel>(context);
    final homeModel = Provider.of<HomeModel>(context);
    final words = homeModel.getWords();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 3),
        Expanded(
          child: words.length == 0
              ? Text(
                  'Enter text or add tiles',
                )
              : GestureDetector(
                  onTap: widget.tapped,
                  child: ListView.builder(
                    // padding: const EdgeInsets.symmetric(
                    //   vertical: 10.0,
                    //   horizontal: 10.0,
                    // ),
                    //User can scroll tiles horizontally
                    scrollDirection: Axis.horizontal,
                    itemCount: words.length,
                    itemBuilder: (BuildContext context, int index) {
                      TileData tileInfo = words[index];
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Tile(
                          text: tileInfo.labelKey.split('.').last,
                          content: 'assets' + tileInfo.image,
                          color: dialogModel.tileBackgroundColor,
                          labelPos: dialogModel.tileLabelTop,
                          labelColor: dialogModel.tileTextColor,
                        ),
                      );
                      // //If tile is for adding user text input, create TextTile()
                      // if (tileData.name == "Edit") {
                      //   return TextTile();
                      //   //else create normal tile
                      // }
                      // else {
                      //   return SizedBox(
                      //     width: MediaQuery.of(context).size.width * 0.2,
                      //     child: Tile(
                      //       text: tileData.name,
                      //       content: tileData.content,
                      //       color: dialogModel.tileBackgroundColor,
                      //       labelPos: dialogModel.tileLabelTop,
                      //     ),
                      //   );
                      // }
                    },
                  ),
                ),
        ),
        SizedBox(width: 5),
        // Backspace Button
        GestureDetector(
          onTap: () {
            setState(() {
              homeModel.removeWords();
            });
          },
          child: Icon(
            Icons.backspace,
            color: Theme.of(context).primaryColor,
            size: 25.0,
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
