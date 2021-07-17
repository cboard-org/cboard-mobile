import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:cboard_mobile/unlocked/UnlockedHomepage.dart';

class ManageBoardsScreen extends StatefulWidget {
  const ManageBoardsScreen({Key key}) : super(key: key);
  @override
  _ManageBoardsScreenState createState() => _ManageBoardsScreenState();
}

class _ManageBoardsScreenState extends State<ManageBoardsScreen> {
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
                "Manage Boards"), // Debug: Change title to keep track of how many tiles
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Newest',
                      style: TextStyle(
                          color: paua,
                          fontSize: 16.0,
                          fontFamily: "Robotto",
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                )),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/card_placeholder.png'),
                    Expanded(
                        child: ListTile(
                            isThreeLine: true,
                            title: const Text(
                              "Board Tile",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "20 Tiles",
                                ),
                                Text("Made on 10/20/20"),
                                Text("Offline")
                              ],
                            ))),
                    Align(
                      alignment: Alignment(0.8, -6),
                      heightFactor: 0.5,
                      child: Icon(Icons.share),
                    )
                  ],
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/card_placeholder.png'),
                    Expanded(
                        child: ListTile(
                            isThreeLine: true,
                            title: const Text(
                              "Board Tile",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "20 Tiles",
                                ),
                                Text("Made on 10/20/20"),
                                Text("Offline")
                              ],
                            ))),
                    Align(
                      alignment: Alignment(0.8, -6),
                      heightFactor: 0.5,
                      child: Icon(Icons.share),
                    )
                  ],
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/card_placeholder.png'),
                    Expanded(
                        child: ListTile(
                            isThreeLine: true,
                            title: const Text(
                              "Board Tile",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "20 Tiles",
                                ),
                                Text("Made on 10/20/20"),
                                Text("Offline")
                              ],
                            ))),
                    Align(
                      alignment: Alignment(0.8, -6),
                      heightFactor: 0.5,
                      child: Icon(Icons.share),
                    )
                  ],
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/card_placeholder.png'),
                    Expanded(
                        child: ListTile(
                            isThreeLine: true,
                            title: const Text(
                              "Board Tile",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "20 Tiles",
                                ),
                                Text("Made on 10/20/20"),
                                Text("Offline")
                              ],
                            ))),
                    Align(
                      alignment: Alignment(0.8, -6),
                      heightFactor: 0.5,
                      child: Icon(Icons.share),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
        // BUTTONS
        );
  }
}
