import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/unlocked/TileVocalization.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
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
    _scrollController = ScrollController()..addListener(() {});
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnlockedHomeScreen()))
              },
              child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
            ),
            centerTitle: true,
            title: Text(
                'Edit'), // Debug: Change title to keep track of how many tiles
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: screenSize.height / 75,
            ),
            Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: screenSize.width / 2,
                    height: screenSize.height / 4,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: light_orange,
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
                                              color: paua,
                                            ),
                                            title: Text('Take Photos'),
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.insert_photo,
                                              color: paua,
                                            ),
                                            title: Text('Browse Album'),
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.search,
                                              color: paua,
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
              ],
            ),
            Column(
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
                            style: CustomTypography.Typography.title()),
                        subtitle: Text(widget.tile.name,
                            style: CustomTypography.Typography.subTitle()),
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
                                        tilename: widget.tile.name,
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
                            style: CustomTypography.Typography.title()),
                        subtitle: Text(widget.tile.vocalization,
                            style: CustomTypography.Typography.subTitle()),
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
                                        tileVocalization:
                                            widget.tile.vocalization,
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
                            style: CustomTypography.Typography.title()),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Wrap(
                            children: [
                              InkResponse(
                                child: new Container(
                                  width: 20,
                                  height: 20,
                                  decoration: new BoxDecoration(
                                    color: light_blue,
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
                                    color: dark_green,
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
                                    color: bold_yellow,
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
                                    color: light_pink,
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
                                    color: light_purple,
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
                                    color: bright_orange,
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
                                    color: cinnabar,
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
                            style: CustomTypography.Typography.title()),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Wrap(
                            children: [
                              InkResponse(
                                child: new Container(
                                  width: 20,
                                  height: 20,
                                  decoration: new BoxDecoration(
                                    color: light_blue,
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
                                    color: dark_green,
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
                                    color: bold_yellow,
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
                                    color: light_pink,
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
                                    color: light_purple,
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
                                    color: bright_orange,
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
                                    color: cinnabar,
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
                            style: CustomTypography.Typography.title()),
                        subtitle: Text('On',
                            style: CustomTypography.Typography.subTitle()),
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
            Center(
              child: Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding:
                      EdgeInsets.only(top: 10, left: 65, right: 65, bottom: 10),
                  child: Text(
                    "SAVE",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )
        // BUTTONS
        );
  }
}
