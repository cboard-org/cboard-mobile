import 'dart:async';

import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/lockedScreen/widgets/folderTile.dart';
import 'package:cboard_mobile/lockedScreen/widgets/sentence_bar.dart';
import 'package:cboard_mobile/lockedScreen/widgets/tile.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:cboard_mobile/models/home.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/main_app_bar.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeScreen extends StatefulWidget {
  final List<Data> data;
  const HomeScreen({Key key, this.data}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;
  FlutterTts flutterTts = FlutterTts();

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

    //Keep track Label Position
    final dialologModel = Provider.of<DialogModel>(context);
    final homeModel = Provider.of<HomeModel>(context);

    final data = widget.data;

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
              Container(
                height: screenSize.height * (2 / 15),
                child: SentenceBar(
                  //Speak full sentence
                  tapped: () => _speak(homeModel.getFullSent()),
                ),
              ),

              // Main Navigation Bar
              Expanded(
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
          itemCount: data.length + 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // Total 3 tiles on one row.
            // ignore: todo
            //TODO: Integrate with Display Layout Options of Unlocked Screens
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            // 'Add text' tile
            if (index == 0) {
              return Tile(
                labelPos: dialologModel.labelTop,
                text: "Add text",
                content: 'assets/symbols/A.svg',
                color: soft_green,
                //User taps to add sentence in the top sentence bar
                tapped: () => {
                  setState(() {
                    homeModel.addWords(TileData("Edit", "", paua));
                  }),
                },
              );

              // 'Add tile/folder' tile
            } else if (index == data.length + 1) {
              return Tile(
                  labelPos: dialologModel.labelTop,
                  text: "Add tile/folder",
                  content: 'assets/symbols/A.svg',
                  color: soft_green,
                  //Tapped function is null as user can't add tile in Unlocked Screen
                  tapped: () => {});

              //Normal tile
            } else {
              final Data info = data[index - 1];
              if (info is TileData) {
                return Tile(
                  labelPos: dialologModel.labelTop,
                  text: info.name,
                  content: info.content,
                  color: dialologModel.tileBackgroundColor,
                  tapped: () => {
                    //Speak word in the tile
                    _speak(info.name),
                    setState(() {
                      homeModel.addWords(info);
                    })
                  },
                );
              } else {
                FolderData folderdata = info;
                return FolderTile(
                  text: info.name,
                  content: info.content,
                  tiles: folderdata.tiles,
                  color: dialologModel.folderBackgroundColor,
                );
              }
            }
          },
        ),
      ),
    );
  }
}
