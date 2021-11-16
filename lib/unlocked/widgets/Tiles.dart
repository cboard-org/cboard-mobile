import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/unlocked/AddTile.dart';
import 'package:cboard_mobile/unlocked/UnlockedHomepage.dart';
import 'package:cboard_mobile/unlocked/providers/unlocked_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/unlocked/data.dart';

import 'package:cboard_mobile/unlocked/EditTile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TilesWidget extends StatelessWidget {
  final Tile tile;
  final double size;

  const TilesWidget({Key key, @required this.tile, @required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<UnlockedHomeProvider>(
        builder: (context, unlockedHomeProvider, child) {
      return GestureDetector(
          onTap: () {
            if (unlockedHomeProvider.selectMode) {
              if (!unlockedHomeProvider.selectList.containsKey(tile.name))
                Provider.of<UnlockedHomeProvider>(context, listen: false)
                    .addToSelect(tile);
              else
                Provider.of<UnlockedHomeProvider>(context, listen: false)
                    .removeFromSelect(tile);
            } else {
              if (tile.isFolder) {
                Provider.of<UnlockedHomeProvider>(context, listen: false)
                    .addToNavigation(tile.name);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnlockedHomeScreen(
                              tiles: tile.tiles,
                            ))).then((value) => {
                      Provider.of<UnlockedHomeProvider>(context, listen: false)
                          .popNavigation()
                    });
              }
            }
          },
          onLongPress: () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: 'Image Dialog',
                pageBuilder: (
                  _,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) =>
                    ImageDialog(tile: tile));
          },
          child: Card(
              margin: EdgeInsets.all(5),
              elevation: 2,
              child: Stack(
                children: [
                  if(tile.isFolder)
                  Icon(
                    Icons.folder,
                    color: Color(int.parse("0xff"+tile.backgroundColor)),
                    size: 130,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color:
                              Color(int.parse("0xff" + tile.backgroundColor)),
                          child: SvgPicture.asset(
                            tile.imageUrl,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        color: white,
                        height: MediaQuery.of(context).size.height / 34,
                        child: Center(
                          child: Text(tile.name,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Robotto",
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ],
                  ),
                  if (unlockedHomeProvider.selectMode &&
                      unlockedHomeProvider.selectList.containsKey(tile.name))
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
              )));
    });
  }
}

class AddWidget extends StatelessWidget {
  final double size;
  const AddWidget({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddTileScreen()));
      },
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                color:
                shalimar,
                child: SvgPicture.asset(
                  "assets/symbols/mulberry/add.svg",
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: white,
              height: MediaQuery.of(context).size.height / 34,
              child: Center(
                child: Text("Add",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "Robotto",
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class FolderWidget extends StatelessWidget {
//   final Tile tile;
//   final double size;
//
//   const FolderWidget({Key key,@required Tile tile,@required double size}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


class ImageDialog extends StatelessWidget {
  final Tile tile;
  const ImageDialog({Key key, @required this.tile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
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
            width: _screenSize.width * 0.7,
            height: _screenSize.height * 0.35,
            child: Card(
                // margin: EdgeInsets.all(5),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: _screenSize.height * 0.35 - 22,
                    color: Color(int.parse("0xff" + tile.backgroundColor)),
                    child: SvgPicture.asset(
                      tile.imageUrl,
                      width: 277.11,
                    ),
                  ),
                ),
                Container(
                  height: 22,
                  child: Center(
                    child: Text(tile.name,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: "Robotto",
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ],
            )),
          ),
        ),
        Spacer(),
        BottomSheet(
          onClosing: () {
            print("Bottom Sheet Close");
          },
          // height: _screenSize.height*0.4,
          builder: (context) => Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.edit,
                  color: paua,
                ),
                title: Text('Edit Tiles'),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTileScreen(tile: tile)))
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
                  style: TextStyle(color: cinnabar),
                ),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTileScreen(
                                tile: tile,
                                isDelete: true,
                              )))
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
