import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/unlocked/EditTile.dart';
import 'package:cboard_mobile/unlocked/providers/edit_tile_provider.dart';
import 'package:cboard_mobile/unlocked/providers/unlocked_home_provider.dart';
import 'package:cboard_mobile/unlocked/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/unlocked/data.dart';
import 'package:provider/provider.dart';

class UnlockedHomeScreen extends StatefulWidget {
  final List<Tile> tiles;
  const UnlockedHomeScreen({Key key, this.tiles}) : super(key: key);
  @override
  _UnlockedHomeScreenState createState() => _UnlockedHomeScreenState();
}

class _UnlockedHomeScreenState extends State<UnlockedHomeScreen> {
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
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: paua,
        ),
        onPressed: () => Navigator.pop(context),
        backgroundColor: white,
        shape: CircleBorder(side: BorderSide(color: paua)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 110),
        child: Container(
          margin: EdgeInsets.only(
              top: screenSize.height /
                  30), // avoid overlapping with phone's top display stuff
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //SentenceBar(), // Sentence Creation Section
              UnlockedMainBar(
                  scrollOffset: _scrollOffset), // Main Navigation Bar
              Container(
                  height: 30,
                  margin: EdgeInsets.fromLTRB(10, 6, 6, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<UnlockedHomeProvider>(
                          builder: (context, unlockedHomeProvider, child) {
                        return Text(
                          unlockedHomeProvider.prettyNavigation(),
                          style: TextStyle(
                            color: paua,
                            fontSize: 14.0,
                            fontFamily: "Robotto",
                          ),
                        );
                      }),
                      Consumer<UnlockedHomeProvider>(
                        builder: (context, unlockedHomeProvider, child) {
                          return unlockedHomeProvider.selectMode
                              ? unlockedHomeProvider.selectList.isEmpty
                                  ? Row(
                                      children: [
                                        TextButton(
                                          child: Container(
                                            // height: 100,
                                            child: Text(
                                              'SELECT ALL',
                                              style: TextStyle(
                                                  color: paua,
                                                  fontSize: 14.0,
                                                  fontFamily: "Proxima Nova",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          onPressed: () {
                                            Provider.of<UnlockedHomeProvider>(
                                                    context,
                                                    listen: false)
                                                .selectAll(widget.tiles);
                                          },
                                        ),
                                        TextButton(
                                          child: Container(
                                            // height: 100,
                                            child: Text(
                                              'CANCEL',
                                              style: TextStyle(
                                                  color: paua,
                                                  fontSize: 14.0,
                                                  fontFamily: "Proxima Nova",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          onPressed: () {
                                            Provider.of<UnlockedHomeProvider>(
                                                    context,
                                                    listen: false)
                                                .switchSelectionMode();
                                          },
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        TextButton(
                                          child: Container(
                                            // height: 100,
                                            child: Text(
                                              'DESELECT ALL',
                                              style: TextStyle(
                                                  color: paua,
                                                  fontSize: 14.0,
                                                  fontFamily: "Proxima Nova",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          onPressed: () {
                                            Provider.of<UnlockedHomeProvider>(
                                                    context,
                                                    listen: false)
                                                .clearSelect();
                                          },
                                        ),
                                        TextButton(
                                          child: Container(
                                            // height: 100,
                                            child: Text(
                                              'CANCEL',
                                              style: TextStyle(
                                                  color: paua,
                                                  fontSize: 14.0,
                                                  fontFamily: "Proxima Nova",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          onPressed: () {
                                            Provider.of<UnlockedHomeProvider>(
                                                    context,
                                                    listen: false)
                                                .switchSelectionMode();
                                          },
                                        )
                                      ],
                                    )
                              : TextButton(
                                  child: Container(
                                    // height: 100,
                                    child: Text(
                                      'SELECT',
                                      style: TextStyle(
                                          color: paua,
                                          fontSize: 14.0,
                                          fontFamily: "Proxima Nova",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<UnlockedHomeProvider>(context,
                                            listen: false)
                                        .switchSelectionMode();
                                  },
                                );
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      body: Container(
        child: GridView.count(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 7.0,
          ),
          crossAxisCount: 3,
          children: widget.tiles?.map((item) {
            return TilesWidget(
              tile: item,
              size: screenSize.width * 0.3,
            );
          })?.toList(),
        ),
      ),
      bottomNavigationBar: Consumer<UnlockedHomeProvider>(
        builder: (context, unlockedHomeProvider, child) {
          if (unlockedHomeProvider.selectMode) {
            return Container(
              color: paua,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    unlockedHomeProvider.selectList.isEmpty
                        ? 'SELECT TILES'
                        : '${unlockedHomeProvider.selectList.length} SELECTED TILES',
                    style: TextStyle(
                        color: white,
                        fontSize: 14.0,
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Consumer<EditTileProvider>(
                    builder: (context, editTileProvider, child) {
                      return IconButton(
                          onPressed: () {
                            if (unlockedHomeProvider.selectList.isNotEmpty) {
                              Provider.of<EditTileProvider>(context,
                                      listen: false)
                                  .addAllEditList(unlockedHomeProvider
                                      .selectList.values
                                      .toList());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditTileScreen(
                                            isMultiple: true,
                                            tile: editTileProvider.editList[0],
                                            index: 0,
                                          )));
                            }
                          },
                          icon: Icon(
                            Icons.edit,
                            color: unlockedHomeProvider.selectList.isEmpty
                                ? grey
                                : white,
                          ));
                    },
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: white,
                      )),
                ],
              ),
            );
          }
          return SizedBox(
            height: 0.0,
          );
        },
      ),
    );
  }
}
