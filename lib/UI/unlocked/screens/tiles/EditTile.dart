import 'package:cboard_mobile/Providers/unlocked/edit_tile_provider.dart';
import 'package:cboard_mobile/UI/unlocked/screens/UnlockedHomepage.dart';
import 'package:cboard_mobile/UI/unlocked/screens/tiles/VoiceRecorder.dart';
import 'package:cboard_mobile/models/data/data_unlocked.dart';
import 'package:cboard_mobile/services/utils.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditTileScreen extends StatefulWidget {
  final bool isMultiple;
  final Tile tile;
  final bool isDelete;
  final int index;
  final Map<Text, IconData> modelBottom = {
    Text('Take Photos'): Icons.photo_camera,
    Text('Browse Albums'): Icons.insert_photo,
    Text('Search Community'): Icons.search
  };

  final List<Color> editColors = [
    light_blue,
    dark_green,
    bold_yellow,
    light_pink,
    light_purple,
    bright_orange,
    cinnabar
  ];

  EditTileScreen(
      {Key key,
      this.isMultiple = false,
      this.tile,
      this.isDelete = false,
      this.index})
      : super(key: key);

  @override
  _EditTileScreenState createState() => _EditTileScreenState();
}

class _EditTileScreenState extends State<EditTileScreen> {
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
    _bgColor = widget.tile?.backgroundColor;
    _textColor = widget.tile?.textColor;
    if (widget.isDelete) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to delete this tile?",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "This action cannot be undone.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          autofocus: true,
                          style: OutlinedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            // minimumSize: Size(140,35),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "YES",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            // minimumSize: Size(140,35),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "NO",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              );
            });
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController()
      ..text = widget.tile.name;
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
          title: widget.tile?.name != "Label"
              ? Text('Edit')
              : Text(
                  "New Tile or Folder"), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: ListView(
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
                                color: Color(int.parse("0xff" + _bgColor ??
                                    widget.tile.backgroundColor))),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  widget.tile.imageUrl,
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
                        child: Text(widget.tile.name,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Robotto",
                                fontWeight: FontWeight.w500,
                                color: Color(int.parse("0xff" + _textColor ??
                                    widget.tile.textColor)))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Visibility(
                visible: widget.tile.name == "Label",
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: new BorderSide(color: Colors.black12),
                    ),
                  ),
                  child: ListTile(
                    // Tile Name
                    title: Text('Card Type',
                        style: CustomTypography.Typography.title()),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Text("Tile",
                              style: CustomTypography.Typography.subTitle()),
                          leading: Radio<String>(
                            value: 'Tile',
                            groupValue: _type,
                            onChanged: (String val) {
                              setState(() {
                                _type = val;
                              });
                              print(_type);
                            },
                          ),
                        ),
                        ListTile(
                          title: Text("Folder",
                              style: CustomTypography.Typography.subTitle()),
                          leading: Radio<String>(
                            value: 'Folder',
                            groupValue: _type,
                            onChanged: (String val) {
                              setState(() {
                                _type = val;
                              });
                              print(_type);
                            },
                          ),
                        ),
                      ],
                    ),
                    // trailing: Wrap(
                    //   children: [
                    //     Icon(Icons.keyboard_arrow_right,
                    //         size: 35.0, color: Colors.black54),
                    //   ],
                    // ),
                    // Debug: change to edit
                  ),
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
                          onPressed: () => Utils.speak(
                              widget.tile.name != "Label"
                                  ? widget.tile.name
                                  : ""),
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
                            for (var colorCircular in widget.editColors)
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
                            for (var colorCircular in widget.editColors)
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
                                      tileRecord:
                                          widget.tile.isRecording ?? true,
                                      tile: widget.tile,
                                    )))
                      }, // Debug: change to edit
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (widget.isMultiple)
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
      bottomNavigationBar: Consumer<EditTileProvider>(
        builder: (context, editTileProvider, child) {
          if (widget.isMultiple) {
            return Container(
              color: mercury,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: paua,
                      ),
                      label: Text(
                        'Back',
                        style: TextStyle(color: paua),
                      )),
                  SizedBox(
                    width: screenSize.width * 0.5,
                    child: LinearProgressIndicator(
                      color: paua,
                      value:
                          (widget.index + 1) / editTileProvider.editList.length,
                      backgroundColor: grey,
                    ),
                  ),
                  if ((widget.index + 1) < editTileProvider.editList.length)
                    TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditTileScreen(
                                        tile: editTileProvider
                                            .editList[widget.index + 1],
                                        isMultiple: true,
                                        index: widget.index + 1,
                                      )));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: paua,
                        ),
                        label: Text(
                          'Next',
                          style: TextStyle(color: paua),
                        ))
                ],
              ),
            );
          }
          return SizedBox(
            height: 0.0,
          );
        },
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
