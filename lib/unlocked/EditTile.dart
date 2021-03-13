import 'package:cboard_mobile/unlocked/TileVocalization.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';

import 'package:cboard_mobile/unlocked/UnlockedHomepage.dart';
import 'package:cboard_mobile/unlocked/TileName.dart';

class EditTileScreen extends StatefulWidget {
  final Tile tile;

  const EditTileScreen({Key key, this.tile}) : super(key: key);
  @override
  _EditTileScreenState createState() => _EditTileScreenState();
}

class _EditTileScreenState extends State<EditTileScreen> {
  ScrollController _scrollController;
  // double _scrollOffset = 0.0;
  bool lock = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        // setState(() {
        //   _scrollOffset = _scrollController.offset;
        // });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UnlockedHomeScreen()))
            },
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          centerTitle: true,
          title: Text(
              'Edit'), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenSize.height / 75,
            ),
            Stack(
              children: <Widget>[
                lock
                    ? Positioned(
                        left: 10.0,
                        child: Icon(
                          Icons.lock,
                          color: Colors.black45,
                          size: 75,
                        ),
                      )
                    : SizedBox(width: 0, height: 0),
                Center(
                  child: Container(
                    width: screenSize.width / 2,
                    height: 168,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: Color(0xffF8C199),
                                child: GestureDetector(
                                  onTap: () => {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Wrap(
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.photo_camera,
                                                color: Color(0xff23036A),
                                              ),
                                              title: Text('Take Photos'),
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.insert_photo,
                                                color: Color(0xff23036A),
                                              ),
                                              title: Text('Browse Album'),
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.search,
                                                color: Color(0xff23036A),
                                              ),
                                              title: Text('Search Community'),
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  },
                                  child: Image.asset(
                                    widget.tile.imageUrl,
                                    width: screenSize.width / 2,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 24,
                              child: Text(widget.tile.name,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Robotto",
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              elevation: 0.0,
              // margin: const EdgeInsets.fromLTRB(1.0, 8.0, 1.0, 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          // Tile Name
                          title: Text('Tile Name',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          subtitle: Text(widget.tile.name,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff7C7C7C))),
                          trailing: Wrap(
                            children: [
                              Icon(Icons.keyboard_arrow_right,
                                  size: 35.0, color: Colors.black54),
                            ],
                          ),
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TileName(
                                          tile: widget.tile,
                                        )))
                          }, // Debug: change to edit
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Vocalization',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          subtitle: Text(widget.tile.vocalization,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff7C7C7C))),
                          trailing: Wrap(
                            children: [
                              Icon(Icons.keyboard_arrow_right,
                                  size: 35.0, color: Colors.black54),
                            ],
                          ),
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TileVocalization(
                                          tile: widget.tile,
                                        )))
                          }, // Debug: change to edit
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Title Background Color',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          // subtitle: Text('Test',
                          //     style: TextStyle(
                          //         fontSize: 12, color: Color(0xff7C7C7C))),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Wrap(
                              children: [
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffBBDEFB),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xff2E7D32),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffEACA1E),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffF4828E),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffBA82DF),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffF99E5C),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffE53935),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () =>
                              print('Tile Name'), // Debug: change to edit
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Tile Text Color',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Wrap(
                              children: [
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffBBDEFB),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xff2E7D32),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffEACA1E),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffF4828E),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffBA82DF),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffF99E5C),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkResponse(
                                  child: new Container(
                                    width: 20,
                                    height: 20,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffE53935),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () =>
                              print('Tile Name'), // Debug: change to edit
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Voice Recorder',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          subtitle: Text('On',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff7C7C7C))),
                          trailing: Wrap(
                            children: [
                              Icon(Icons.keyboard_arrow_right,
                                  size: 35.0, color: Colors.black54),
                            ],
                          ),
                          onTap: () =>
                              print('Tile Name'), // Debug: change to edit
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: screenSize.width / 4,
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding:
                      EdgeInsets.only(top: 10, left: 65, right: 65, bottom: 10),
                  child: Text(
                    "SAVE",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() => lock = !lock);
                  },
                ),
                SizedBox(
                  width: screenSize.width / 4,
                )
              ],
            )
            // BUTTONS
          ],
        ),
      ),
    );
  }
}
