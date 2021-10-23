import 'dart:convert';
import 'dart:ui';

import 'package:cboard_mobile/models/manageBoard.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/unlocked/EditBoard.dart';
import 'package:cboard_mobile/unlocked/NewBoard.dart';
import 'package:cboard_mobile/unlocked/Public.dart';
import 'package:cboard_mobile/unlocked/widgets/UnlockedMainBar.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/unlocked/data.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:http/http.dart' as http;
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class ManageBoardsScreen extends StatefulWidget {
  const ManageBoardsScreen({Key key}) : super(key: key);
  @override
  _ManageBoardsScreenState createState() => _ManageBoardsScreenState();
}

class _ManageBoardsScreenState extends State<ManageBoardsScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final List<List<String>> names = <List<String>>[
    [
      'assets/images/user.png',
      'title',
      'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'title',
      'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'title',
      'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'title',
      'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'title',
      'number of tiles',
      'made on',
      'offline'
    ],
  ];
  final List<List<String>> names2 = <List<String>>[
    [
      'assets/images/user.png',
      'Public Board Tile ',
      'made by name'
          'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'Board Tile',
      'made by name'
          'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'Board Tile 2',
      'made by name'
          'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'Board Tile 3',
      'made by name'
          'number of tiles',
      'made on',
      'offline'
    ],
    [
      'assets/images/user.png',
      'title',
      'made by name'
          'number of tiles',
      'made on',
      'offline'
    ],
  ];
  TabBar _getTabBar() {
    return TabBar(
      indicator: BubbleTabIndicator(
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
        indicatorRadius: 20,
        indicatorHeight: 60.0,
        indicatorColor: paua,
      ),
      labelColor: Colors.white,
      unselectedLabelColor: studio,
      tabs: <Widget>[
        Text('My Boards'),
        Text('Community'),
      ],
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height) / 15,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UnlockedMainBar()))
            },
            child: Icon(Icons.arrow_back, color: white, size: 25.0),
          ),
          centerTitle: true,
          title: Text(
              "Manage Boards"), // Debug: Change title to keep track of how many tiles
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            _getTabBar(),
            SizedBox(height: 30),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton(
                      hint: _dropDownValue == null
                          ? Text('Newest')
                          : Text(
                              _dropDownValue,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                      //isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      items: ['Newest', 'Oldest', 'Popular'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            _dropDownValue = val;
                          },
                        );
                      },
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewBoard()),
                          );
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height,
                child: _getTabBarView(
                  <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: names.length,
                            itemBuilder: (BuildContext context, int index) {
                              return new Card(
                                clipBehavior: Clip.antiAlias,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: slideSheet1,
                                        child: Image.asset(names[index][0]),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          isThreeLine: true,
                                          title: Text(
                                            names[index][1],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                names[index][2],
                                              ),
                                              Text(names[index][3]),
                                              Text(names[index][4])
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            child: Icon(Icons.add),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0))),
                                                    backgroundColor: white,
                                                    content: Container(
                                                      height: 300,
                                                      width: 300,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Copy Board into your communicator',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'This action will create a copy of the public board and will add it into your communicator. Do you want to proceed?',
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              RaisedButton(
                                                                splashColor:
                                                                    paua,
                                                                disabledColor:
                                                                    Colors
                                                                        .white,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color:
                                                                            paua),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0)),
                                                                child: Text(
                                                                  "No",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0,
                                                                      color:
                                                                          paua),
                                                                ),
                                                              ),
                                                              RaisedButton(
                                                                splashColor:
                                                                    paua,
                                                                disabledColor:
                                                                    Colors
                                                                        .white,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color:
                                                                            paua),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0)),
                                                                child: Text(
                                                                  "Yes",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0,
                                                                      color:
                                                                          paua),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(height: 40),
                                          GestureDetector(
                                            child: Icon(Icons.info_rounded),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0))),
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: Container(
                                                      height: 300,
                                                      width: 300,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Public Board Title',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'Board Author: Full Name\nDescription:\nLast Edited: 10/20/20\nNumber of Tiles: 10 \nBoard ID: 5oijwiojv0923j920jfiwef\nNumber of downloads: 2,463',
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          RaisedButton(
                                                            disabledColor:
                                                                Colors.white,
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color:
                                                                        paua),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0)),
                                                            child: Text(
                                                              "Close",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: paua),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                      // Align(
                                      //   alignment: Alignment.topLeft,
                                      //   heightFactor: 4,
                                      //   child: Icon(Icons.share),
                                      // ),
                                      // Align(
                                      //   alignment: Alignment(0.8, -6),
                                      //   heightFactor: 0.5,
                                      //   child: Icon(Icons.share),
                                      // )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: names2.length,
                            itemBuilder: (BuildContext context, int index) {
                              return new Card(
                                clipBehavior: Clip.antiAlias,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PublicBoards()))
                                        },
                                        child: Image.asset(names2[index][0]),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          isThreeLine: true,
                                          title: Text(
                                            names2[index][1],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                names2[index][2],
                                              ),
                                              Text(names2[index][3]),
                                              Text(names2[index][4]),
                                              Text(names2[index][5])
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            child: Icon(Icons.add),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0))),
                                                    backgroundColor: white,
                                                    content: Container(
                                                      height: 300,
                                                      width: 300,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Copy Board into your communicator',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'This action will create a copy of the public board and will add it into your communicator. Do you want to proceed?',
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              RaisedButton(
                                                                disabledColor:
                                                                    Colors
                                                                        .white,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color:
                                                                            paua),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0)),
                                                                child: Text(
                                                                  "No",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0,
                                                                      color:
                                                                          paua),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                              RaisedButton(
                                                                disabledColor:
                                                                    white,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color:
                                                                            paua),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0)),
                                                                child: Text(
                                                                  "Yes",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0,
                                                                      color:
                                                                          paua),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(height: 40),
                                          GestureDetector(
                                            child: Icon(Icons.info_rounded),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0))),
                                                    backgroundColor: white,
                                                    content: Container(
                                                      height: 300,
                                                      width: 300,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Public Board Title',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'Board Author: Full Name\nDescription:\nLast Edited: 10/20/20\nNumber of Tiles: 10 \nBoard ID: 5oijwiojv0923j920jfiwef\nNumber of downloads: 2,463',
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          RaisedButton(
                                                            disabledColor:
                                                                Colors.white,
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color:
                                                                        paua),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0)),
                                                            child: Text(
                                                              "Close",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: paua),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                      // Align(
                                      //   alignment: Alignment.topLeft,
                                      //   heightFactor: 4,
                                      //   child: Icon(Icons.share),
                                      // ),
                                      // Align(
                                      //   alignment: Alignment(0.8, -6),
                                      //   heightFactor: 0.5,
                                      //   child: Icon(Icons.share),
                                      // )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void slideSheet1() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          height: 350,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: FlatButton(
                    height: 30,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EditBoard()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Color(0xff23036A),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: Color(0xff23036A),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: FlatButton(
                    height: 30,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.control_point_duplicate_sharp,
                          color: Color(0xff23036A),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Duplicate',
                          style: TextStyle(
                            color: Color(0xff23036A),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: FlatButton(
                    height: 30,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lock,
                          color: Color(0xff23036A),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Lock',
                          style: TextStyle(
                            color: Color(0xff23036A),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: FlatButton(
                    height: 30,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Color(0xff23036A),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Hide',
                          style: TextStyle(
                            color: Color(0xff23036A),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: FlatButton(
                    height: 30,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Color(0xff23036A),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                            color: Color(0xff23036A),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
