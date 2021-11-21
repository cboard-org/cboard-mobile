import 'dart:async';

import 'package:cboard_mobile/providers/locked/dialog.dart';
import 'package:cboard_mobile/providers/locked/home.dart';
import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/UI/locked/widgets/folderWidget.dart';
import 'package:cboard_mobile/UI/locked/widgets/sentence_bar.dart';
import 'package:cboard_mobile/UI/locked/widgets/tileWidget.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import '../widgets/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, FolderModel> data;
  final String boardId;

  // const HomeScreen({Key key, this.data, this.folderId}) : super(key: key);
  const HomeScreen({Key key, @required this.data, @required this.boardId})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController; //enable scrolling the screen
  double _scrollOffset = 0.0;
  FlutterTts flutterTts = FlutterTts(); //implement Flutter tts

  final GlobalKey<ScaffoldState> _lockedScaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
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
    //Keep track of screen size
    final Size screenSize = MediaQuery.of(context).size;

    //State management model
    final dialologModel = Provider.of<DialogModel>(context);
    final homeModel = Provider.of<HomeModel>(context);

    final data = widget.data;
    final FolderModel folderModel = widget.data[widget.boardId];

    //Flutter tts object
    Future _speak(String text) async {
      await flutterTts.speak(text);
    }

    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.2),
        child: Container(
          // Avoid overlapping with phone's top display stuff
          margin: EdgeInsets.only(top: 25.0),
          // Top two bars
          child: Column(
            children: <Widget>[
              // Sentence Creation Section
              Expanded(
                flex: 3,
                // height: screenSize.height * (2 / 15),
                child: SentenceBar(
                  //Speak full sentence
                  tapped: () => _speak(homeModel.getFullSent()),
                ),
              ),
              // Main Navigation Bar
              Expanded(
                flex: 2,
                child: MainAppBar(scrollOffset: _scrollOffset),
              ),
            ],
          ),
        ),
      ),
      //Tiles section
      body: Container(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 7.0,
            horizontal: 7.0,
          ),
          // Add list of tiles from database together with 2 tiles for 'Add text' and 'Add tile/folder'
          itemCount: folderModel.subItems.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // Total 3 tiles on one row.
            //TODO: Integrate with Display Layout Options of Unlocked Screens
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            // 'Add text' tile

            // if (index == 0) {
            //   return Tile(
            //     labelPos: dialologModel.labelTop,
            //     text: "Add text",
            //     content: 'assets/symbols/A.svg',
            //     color: soft_green,
            //     //User taps to add sentence in the top sentence bar
            //     tapped: () => {
            //       setState(() {
            //         homeModel.add(TileData(name: "Edit", content: "", color: paua));
            //       }),
            //     },
            //   );

            //   // 'Add tile/folder' tile
            // } else

            // if (index == data.length) {
            if (index == 0) {
              return TileWidget(
                  labelPos: dialologModel.tileLabelTop,
                  text: "Add text",
                  content: 'assets/symbols/mulberry/a_-_lower_case.svg',
                  color: soft_green,
                  //User taps to add sentence in the top sentence bar
                  tapped: () => {} //null for now
                  //Later, use or change this function to add text
                  // () => {
                  //   setState(() {
                  //     homeModel.addWords(TileData("Edit", "", paua));
                  //   }),
                  // },
                  );

              // 'Add tile/folder' tile
            }
            // else if (index == folder.subItems.length + 1) {
            //   return Tile(
            //       labelPos: dialologModel.tileLabelTop,
            //       text: "Add tile/folder",
            //       content: 'assets/symbols/mulberry/a_-_lower_case.svg',
            //       color: soft_green,
            //       //Tapped function is null as user can't add tile in Unlocked Screen
            //       tapped: () => {});
            //
            //   //Normal tile
            // }
            else {
              final TileModel tileInfo = folderModel.subItems[index - 1];
              String title = tileInfo.labelKey.split('.').last;
              if (tileInfo.loadBoard == null) {
                return TileWidget(
                  labelPos: dialologModel.tileLabelTop,
                  text: title,
                  content: 'assets' + tileInfo.image,
                  color: dialologModel.tileBackgroundColor,
                  labelColor: dialologModel.tileTextColor,
                  tapped: () => {
                    //Speak word in the tile
                    _speak(title),
                    setState(() {
                      homeModel.addWords(tileInfo);
                    })
                  },
                );
              } else {
                TileModel folderInfo = tileInfo;
                return FolderWidget(
                  text: tileInfo.labelKey.split('.').last,
                  content: 'assets' + tileInfo.image,
                  boardId: folderInfo.loadBoard,
                  color: dialologModel.folderBackgroundColor,
                  labelColor: dialologModel.folderTextColor,
                  labelPos: dialologModel.folderLabelTop,
                );
              }
            }
          },
        ),
      ),
    );
  }
}
