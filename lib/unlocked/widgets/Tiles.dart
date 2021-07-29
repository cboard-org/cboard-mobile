import 'package:cboard_mobile/stylesheets/constants.dart';
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
      },
      onLongPress: (){
        showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: 'Image Dialog',
            pageBuilder: (_,
                Animation<double> animation,
                Animation<double> secondaryAnimation,) => ImageDialog(tile: tile));
        // showModalBottomSheet(
        //   context: context,
        //   builder: (context) {
        //     return Wrap(
        //       children: [
        //         ListTile(
        //           leading: Icon(
        //             Icons.edit,
        //             color: paua,
        //           ),
        //           title: Text('Edit Tiles'),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.layers,
        //             color: paua,
        //           ),
        //           title: Text('Duplicate'),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.visibility_off,
        //             color: paua,
        //           ),
        //           title: Text('Hide'),
        //         ),
        //         ListTile(
        //           leading: Icon(
        //             Icons.delete,
        //             color: paua,
        //           ),
        //           title: Text(
        //             'Delete',
        //             style: TextStyle(color: Color(0xffC62828)),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // );
      },
      child: Container(
        child: Card(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  color: tile.name != "Label" ? light_yellow : light_green,
                  child: Image.asset(
                    tile.imageUrl,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 38,
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
    final Size _screenSize= MediaQuery.of(context).size;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        AlertDialog(
          // insetPadding: EdgeInsets.symmetric(horizontal: 0),
          contentPadding: EdgeInsets.all(0.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 0),
          content: Container(
            // alignment: Alignment.topCenter,
            width: 277.11,
            height: _screenSize.height*0.35,
            child: Card(
                // margin: EdgeInsets.all(5),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 230.75,
                    color: light_yellow,
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
        ),
        Spacer(),
        BottomSheet(
          onClosing: (){
            print("Bottom Sheet Close");
          },
          // height: _screenSize.height*0.4,
          builder:(context) => Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.edit,
                  color: paua,
                ),
                title: Text('Edit Tiles'),
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditTileScreen(tile: tile)))
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.layers,
                  color: paua,
                ),
                title: Text('Duplicate'),
              ),
              ListTile(
                leading: Icon(
                  Icons.visibility_off,
                  color: paua,
                ),
                title: Text('Hide'),
              ),
              ListTile(
                leading: Icon(
                  Icons.delete,
                  color: paua,
                ),
                title: Text(
                  'Delete',
                  style: TextStyle(color: Color(0xffC62828)),
                ),
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditTileScreen(tile: tile,isDelete: true,)))
                },
              ),
            ],
          ),
        )
      ],
    );
  }


}
