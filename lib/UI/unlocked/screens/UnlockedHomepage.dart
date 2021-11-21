import 'package:cboard_mobile/UI/unlocked/screens/tiles/AddTile.dart';
import 'package:cboard_mobile/UI/unlocked/screens/tiles/EditTile.dart';
import 'package:cboard_mobile/UI/unlocked/widgets/tile_options_dialog.dart';
import 'package:cboard_mobile/providers/unlocked/edit_tile_provider.dart';
import 'package:cboard_mobile/providers/unlocked/unlocked_home_provider.dart';
import 'package:cboard_mobile/UI/unlocked/widgets/widgets.dart';
import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/sharedWidgets/folder_widget.dart';
import 'package:cboard_mobile/sharedWidgets/tile_widget.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnlockedHomeScreen extends StatefulWidget {
  final Map<String, FolderModel> data;
  final String folderId;

  // const HomeScreen({Key key, this.data, this.folderId}) : super(key: key);
  const UnlockedHomeScreen(
      {Key key, @required this.data, @required this.folderId})
      : super(key: key);

  @override
  _UnlockedHomeScreenState createState() => _UnlockedHomeScreenState();
}

class _UnlockedHomeScreenState extends State<UnlockedHomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;
  FolderModel folderModel;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    folderModel = widget.data[widget.folderId];
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
                  margin: EdgeInsets.fromLTRB(3, 6, 6, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<UnlockedHomeProvider>(
                          builder: (context, unlockedHomeProvider, child) {
                        return
                            //   Text(
                            //   unlockedHomeProvider.prettyNavigation(),
                            //   style: TextStyle(
                            //     color: paua,
                            //     fontSize: 14.0,
                            //     fontFamily: "Robotto",
                            //   ),
                            // );
                            ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: unlockedHomeProvider.navigation
                                    .map((item) => Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UnlockedHomeScreen(
                                                                data:
                                                                    defaultBoards,
                                                                folderId:
                                                                    item)));
                                              },
                                              child: Text(
                                                defaultBoards[item]
                                                    .nameKey
                                                    .split('.')
                                                    .last,
                                                style: TextStyle(
                                                  color: paua,
                                                  fontSize: 14.0,
                                                  fontFamily: "Robotto",
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ">",
                                              style: TextStyle(
                                                color: paua,
                                                fontSize: 12.0,
                                                fontFamily: "Robotto",
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList());
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
                                                .selectAll(
                                                    folderModel.subItems);
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
        child: Consumer<UnlockedHomeProvider>(
            builder: (context, unlockedHomeProvider, child) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 7.0,
              ),
              itemCount: folderModel.subItems.length + 1,
              itemBuilder: (context, index) {
                if (index == folderModel.subItems.length) {
                  return TileWidget(
                      tileModel: TileModel(
                        backgroundColor: soft_green,
                        image: '/symbols/mulberry/a_-_lower_case.svg',
                        labelKey: "Label",
                      ),
                      tapped: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditTileScreen(
                                          tileModel: TileModel(
                                            backgroundColor: soft_green,
                                            image:
                                                '/symbols/mulberry/a_-_lower_case.svg',
                                            labelKey: "Label",
                                          ),
                                        )))
                          });
                  //Normal tile
                } else {
                  final TileModel tileInfo = folderModel.subItems[index];
                  String title = tileInfo.labelKey.split('.').last;
                  if (tileInfo.loadBoard == null) {
                    return TileWidget(
                        tileModel: tileInfo,
                        tapped: () => {
                              if (unlockedHomeProvider.selectMode)
                                {
                                  if (!unlockedHomeProvider.selectList
                                      .containsKey(tileInfo.labelKey))
                                    Provider.of<UnlockedHomeProvider>(context,
                                            listen: false)
                                        .addToSelect(tileInfo)
                                  else
                                    Provider.of<UnlockedHomeProvider>(context,
                                            listen: false)
                                        .removeFromSelect(tileInfo)
                                }
                              else
                                print(tileInfo.labelKey)
                            },
                        longPressed: () {
                          showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: 'Image Dialog',
                              pageBuilder: (
                                _,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                              ) =>
                                  TileOptionsDialog(tileModel: tileInfo));
                        });
                  } else {
                    TileModel folderInfo = tileInfo;
                    return FolderWidget(
                      folderModel: folderInfo,
                      folderId: folderInfo.loadBoard,
                      tapped: () => {
                        if(unlockedHomeProvider.selectMode){
                          if (!unlockedHomeProvider.selectList
                              .containsKey(tileInfo.labelKey))
                            Provider.of<UnlockedHomeProvider>(context,
                                listen: false)
                                .addToSelect(folderInfo)
                          else
                            Provider.of<UnlockedHomeProvider>(context,
                                listen: false)
                                .removeFromSelect(folderInfo)
                        } else {
                          Provider.of<UnlockedHomeProvider>(context,
                              listen: false)
                              .addToNavigation(folderInfo.loadBoard),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UnlockedHomeScreen(
                                        data: defaultBoards,
                                        folderId: folderInfo.loadBoard,
                                      ))).then((value) =>
                          {
                            Provider.of<UnlockedHomeProvider>(context,
                                listen: false)
                                .popNavigation()
                          })
                        }
                      },
                      longPressed: () {
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: 'Image Dialog',
                            pageBuilder: (
                              _,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                            ) =>
                                TileOptionsDialog(tileModel: tileInfo));
                      },
                    );
                  }
                }
              }
              // if (index < folderModel.subItems.length)
              //   return TilesWidget(
              //     // tile: widget.tiles[index],
              //     size: screenSize.width * 0.3,
              //   );
              // return AddWidget(size: screenSize.width * 0.3);
              );
        }),
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
                                            tileModel: editTileProvider.editList[0],
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
