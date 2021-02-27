import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';

import 'package:cboard_mobile/unlocked/EditTile.dart';

class Tiles extends StatelessWidget {
  final Tile tile;
  final double size;

  const Tiles({Key key, @required this.tile, @required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditTileScreen(tile: tile)))
        // showDialog(context: context, builder: (_) => ImageDialog(tile: tile)),
        // showModalBottomSheet(
        //   context: context,
        //   builder: (context) {
        //     return Wrap(
        //       children: [
        //         ListTile(
        //           leading: Icon(
        //             Icons.edit,
        //             color: Color(0xff23036A),
        //           ),
        //           title: Text('Edit Tiles'),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.layers,
        //             color: Color(0xff23036A),
        //           ),
        //           title: Text('Duplicate'),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.visibility_off,
        //             color: Color(0xff23036A),
        //           ),
        //           title: Text('Hide'),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.delete,
        //             color: Color(0xff23036A),
        //           ),
        //           title: Text(
        //             'Delete',
        //             style: TextStyle(color: Color(0xffC62828)),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // )
      },
      child: Container(
        width: 104.86,
        height: 105,
        child: Card(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 83.54,
                  color: Color(0xffFFF6B1),
                  child: Image.asset(
                    tile.imageUrl,
                    width: 104.86,
                  ),
                ),
                Container(
                  height: 21.44,
                  child: Text(tile.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: "Robotto",
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            )),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final Tile tile;
  const ImageDialog({Key key, @required this.tile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // insetPadding: EdgeInsets.symmetric(horizontal: 0),
      contentPadding: EdgeInsets.all(0.0),
      insetPadding: EdgeInsets.symmetric(horizontal: 0),
      content: Container(
        width: 277.11,
        height: 279,
        child: Card(
            // margin: EdgeInsets.all(5),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 230.75,
                color: Color(0xffFFF6B1),
                child: Image.asset(
                  tile.imageUrl,
                  width: 277.11,
                ),
              ),
            ),
            Container(
              height: 21.44,
              child: Text(tile.name,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Robotto",
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
