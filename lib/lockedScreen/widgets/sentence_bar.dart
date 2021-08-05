import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/lockedScreen/widgets/textTile.dart';
import 'package:cboard_mobile/lockedScreen/widgets/tile.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SentenceBar extends StatefulWidget {
  //List containg all tiles that user tapped
  static List<TileData> words = [];

  @override
  _SentenceBarState createState() => _SentenceBarState();
}

class _SentenceBarState extends State<SentenceBar> {
  @override
  Widget build(BuildContext context) {
    final dialogModel = Provider.of<DialogModel>(context);
    return Row(
      children: [
        SizedBox(width: 3),
        Expanded(
          child: SentenceBar.words.length == 0
              ? Text(
                  'Enter text or add tiles',
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  //User can scroll tiles horizontally
                  scrollDirection: Axis.horizontal,
                  itemCount: SentenceBar.words.length,
                  itemBuilder: (BuildContext context, int index) {
                    TileData tileData = SentenceBar.words[index];
                    //If tile is for adding user text input, create TextTile()
                    if (tileData.name == "Edit") {
                      return TextTile();
                      //else create normal tile
                    } else {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Tile(
                          name: tileData.name,
                          content: tileData.content,
                          color: dialogModel.tileBackgroundColor,
                          labelPos: dialogModel.labelTop,
                        ),
                      );
                    }
                  },
                ),
        ),
        SizedBox(width: 5),
        // Backspace Button
        GestureDetector(
          onTap: () {
            setState(() {
              if (SentenceBar.words.length > 0) {
                SentenceBar.words.removeLast();
              }
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
