import 'package:cboard_mobile/UI/unlocked/screens/UnlockedHomepage.dart';
import 'package:cboard_mobile/UI/unlocked/screens/tiles/VoiceRecorder.dart';
import 'package:cboard_mobile/models/data/data_unlocked.dart';
import 'package:cboard_mobile/services/utils.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddTileScreen extends StatefulWidget {
  final Map<Text, IconData> modelBottom = {
    Text('Take Photos'): Icons.photo_camera,
    Text('Browse Albums'): Icons.insert_photo,
    Text('Search Community'): Icons.search
  };

  final List<Color> colors = [
    light_blue,
    dark_green,
    bold_yellow,
    light_pink,
    light_purple,
    bright_orange,
    cinnabar
  ];

  AddTileScreen({Key key}) : super(key: key);

  @override
  _AddTileScreenState createState() => _AddTileScreenState();
}

class _AddTileScreenState extends State<AddTileScreen> {
  ScrollController _scrollController;

  // double _scrollOffset = 0.0;
  bool lock = false;
  String _bgColor;
  String _textColor;

  String _type = "Tile";

  final _imagePicker = ImagePicker();
  XFile image;

  _pickGallery() async {
    final XFile _imageRes =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = _imageRes;
    });
  }

  _pickCamera() async {
    final XFile _imageRes =
        await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = _imageRes;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() {});
    _bgColor = colorToHex(widget.colors[0]);
    _textColor = colorToHex(widget.colors[0]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UnlockedHomeScreen(
                            tiles: example1,
                          )))
            },
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          centerTitle: true,
          title: Text(
              "New Tile or Folder"), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: screenSize.height / 75,
          ),
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
                                return Wrap(children: [
                                  for (var text in widget.modelBottom.keys)
                                    ListTile(
                                      leading: Icon(
                                        widget.modelBottom[text],
                                        color: paua,
                                      ),
                                      title: text,
                                      onTap: () {
                                        if (widget.modelBottom[text] ==
                                            Icons.photo_camera)
                                          _pickCamera();
                                        else if (widget.modelBottom[text] ==
                                            Icons.insert_photo)
                                          _pickGallery();
                                        else
                                          print("Community Search");
                                      },
                                    ),
                                ]);
                              },
                            )
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(int.parse("0xff" + _bgColor))),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  "assets/symbols/mulberry/add.svg",
                                  width: screenSize.width / 2,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.camera_alt_outlined),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 28,
                      child: Center(
                        child: Text("",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Robotto",
                                fontWeight: FontWeight.w500,
                                color: Color(int.parse("0xff" + _textColor)))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: new BorderSide(color: Colors.black12),
                  ),
                ),
                child: Column(
                  // Tile Name
                  children: [
                    ListTile(
                      title: Text('Card Type',
                          style: CustomTypography.Typography.title()),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Radio<String>(
                            value: 'Tile',
                            groupValue: _type,
                            onChanged: (String val) {
                              setState(() {
                                _type = val;
                              });
                              print(_type);
                            },
                          ),
                          Text("Tile",
                              style: CustomTypography.Typography.subTitle()),
                          Spacer(
                            flex: 2,
                          ),
                          Radio<String>(
                            value: 'Folder',
                            groupValue: _type,
                            onChanged: (String val) {
                              setState(() {
                                _type = val;
                              });
                              print(_type);
                            },
                          ),
                          Text("Folder",
                              style: CustomTypography.Typography.subTitle()),
                          Spacer(
                            flex: 1,
                          )
                        ],
                      ),
                    )
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
                      // Tile Name
                      title: Text('Tile Name',
                          style: CustomTypography.Typography.title()),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            focusColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      // trailing: Wrap(
                      //   children: [
                      //     Icon(Icons.keyboard_arrow_right,
                      //         size: 35.0, color: Colors.black54),
                      //   ],
                      // ),
                      // Debug: change to edit
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
                        // subtitle: Text(widget.tile.vocalization ?? " ",
                        //     style: CustomTypography.Typography.subTitle()),
                        trailing: IconButton(
                          onPressed: () => Utils.speak(""),
                          icon: Icon(
                            Icons.play_arrow,
                            color: paua,
                          ),
                        ) // Debug: change to edit
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
                      title: Text('Tile Background Color',
                          style: CustomTypography.Typography.title()),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Wrap(
                          spacing: 26,
                          children: [
                            for (var colorCircular in widget.colors)
                              InkResponse(
                                onTap: () {
                                  setState(() {
                                    _bgColor = colorToHex(colorCircular);
                                  });
                                },
                                child: CircleAvatar(
                                  radius: screenSize.width / 36,
                                  backgroundColor: colorCircular,
                                  child: Color(int.parse("0xff" + _bgColor)) ==
                                          colorCircular
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                      : null,
                                ),
                                // new Container(
                                //   width: screenSize.width / 18,
                                //   height: screenSize.width / 18,
                                //   decoration: new BoxDecoration(
                                //       color: colorCircular,
                                //       shape: BoxShape.circle,
                                //   ),
                                // ),
                              ),
                            // SizedBox(
                            //   width: 30,
                            // )
                          ],
                        ),
                      ), // Debug: change to edit
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
                          spacing: 26,
                          children: [
                            for (var colorCircular in widget.colors)
                              InkResponse(
                                onTap: () {
                                  setState(() {
                                    _textColor = colorToHex(colorCircular);
                                  });
                                },
                                child: CircleAvatar(
                                  radius: screenSize.width / 36,
                                  backgroundColor: colorCircular,
                                  child:
                                      Color(int.parse("0xff" + _textColor)) ==
                                              colorCircular
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 15,
                                            )
                                          : null,
                                ),
                              ),
                          ],
                        ),
                      ),
                      // onTap: () =>
                      //     print('Tile Name'), // Debug: change to edit
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
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VoiceRecorder(
                                      tileRecord: true,
                                      // tile: widget.tile,
                                    )))
                      }, // Debug: change to edit
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Button(
              label: Text(
                "SAVE",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              isPrimary: true,
              padding: 10,
              onPress: () {},
            ),
          ),

          // Center(
          //   child: Align(
          //     alignment: Alignment.center,
          //     child: OutlinedButton(
          //       style: OutlinedButton.styleFrom(
          //         // primary: ,
          //         backgroundColor: Theme.of(context).primaryColor,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20.0)),
          //         padding:
          //       ),
          //       child:
          //       onPressed: () {},
          //     ),
          //   ),
          // ),
        ],
      ),
      // BUTTONS
    );
  }

  String colorToHex(Color color, {bool leadingHashSign = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${color.alpha.toRadixString(16).padLeft(2, '0')}'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';
}
