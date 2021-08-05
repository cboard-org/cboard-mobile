import 'package:cboard_mobile/lockedScreen/widgets/sentence_bar.dart';
import 'package:cboard_mobile/lockedScreen/widgets/tile.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';
import 'package:provider/provider.dart';
import '../widgets/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

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
                child: SentenceBar(),
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
          itemCount: example.length + 2,
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
                name: "Add text",
                content: 'assets/images/test.png',
                color: soft_green,
                //User taps to add sentence in the top sentence bar
                tapped: () => {
                  setState(() {
                    SentenceBar.words
                        .add(TileData(name: "Edit", isFile: true, content: ""));
                  }),
                },
              );

              // 'Add tile/folder' tile
            } else if (index == example.length + 1) {
              return Tile(
                  labelPos: dialologModel.labelTop,
                  name: "Add tile/folder",
                  content: 'assets/images/AddTile.png',
                  color: soft_green,
                  //Tapped function is null as user can't add tile in Unlocked Screen
                  tapped: () => {});

              //Normal tile
            } else {
              final TileData tileData = example[index - 1];
              return Tile(
                labelPos: dialologModel.labelTop,
                name: tileData.name,
                content: tileData.content,
                color: dialologModel.tileBackgroundColor,
                tapped: () => setState(() {
                  SentenceBar.words.add(tileData);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
