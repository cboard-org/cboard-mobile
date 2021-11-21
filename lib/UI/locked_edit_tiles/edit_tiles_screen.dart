import 'package:cboard_mobile/UI/locked_edit_tiles/change_tile_pic.dart';
import 'package:cboard_mobile/UI/locked_edit_tiles/delete_tile_modal.dart';
import 'package:flutter/material.dart';

class EditTileScreen extends StatefulWidget {
  @override
  _EditTileScreenState createState() => _EditTileScreenState();
}

class _EditTileScreenState extends State<EditTileScreen> {
  bool lock = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => print('Back'),
          child: Icon(Icons.arrow_back, color: Colors.white, size: 35.0),
        ),
        centerTitle: true,
        title: Text(
            'Edit (5 tiles)'), // Debug: Change title to keep track of how many tiles
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenSize.height / 20,
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
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/test.png'),
                        // Debug: change to connect to tile class
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: GestureDetector(onTap: () {
                      changeTilePic(context);
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height / 20,
            ), // Debug: change to relative to all screens
            Card(
              margin: const EdgeInsets.fromLTRB(1.0, 8.0, 1.0, 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: ListTile(
                      // Tile Name
                      title: Text('Tile Name',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      trailing: Wrap(
                        spacing: 6,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Text',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right,
                              size: 35.0, color: Colors.black54),
                        ],
                      ),
                      onTap: () => print('Tile Name'), // Debug: change to edit
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: ListTile(
                      // Vocalization
                      title: Text('Vocalization',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      trailing: Wrap(
                        spacing: 6,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Tekst',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right,
                              size: 35.0, color: Colors.black54),
                        ],
                      ),
                      onTap: () =>
                          print('Vocalization'), // Debug: change to edit
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: ListTile(
                      // Tile background color
                      title: Text('Tile background color',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      trailing: Wrap(
                        spacing: 6,
                        children: <Widget>[
                          Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.only(top: 3.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.amber),
                              child: ClipOval(
                                child: Material(
                                  color: Color(
                                      0xFFBBDEF8), // Debu: change to color of tile bg
                                ),
                              )),
                          Icon(Icons.keyboard_arrow_right,
                              size: 35.0, color: Colors.black54),
                        ],
                      ),
                      onTap: () => print('Tile Color'), // Debug: change to edit
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: new BorderSide(color: Colors.black12),
                      ),
                    ),
                    child: ListTile(
                      // Voice Recorder
                      title: Text('Voice Recorder',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      trailing: Wrap(
                        spacing: 6,
                        children: <Widget>[
                          Icon(Icons.mic, size: 35.0, color: Colors.black54),
                          Icon(Icons.keyboard_arrow_right,
                              size: 35.0, color: Colors.black54),
                        ],
                      ),
                      onTap: () =>
                          print('Voice Recorder'), // Debug: change to edit
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height / 30,
            ),
            // BUTTONS
            Row(
              children: <Widget>[
                SizedBox(
                  width: screenSize.width / 30,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Text(
                      "Lock",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() => lock = !lock);
                    },
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 30,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Color(0xFF3F51B5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Text(
                      "Hide",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: () => print('Hide'), // debug: add function
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 30,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Color(0xFFBB0000),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Text(
                      "Delete",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: () => deleteTile(context),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
