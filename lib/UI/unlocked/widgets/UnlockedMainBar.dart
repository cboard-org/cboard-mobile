import 'package:cboard_mobile/providers/locked/home.dart';
import 'package:cboard_mobile/UI/Settings/SettingWrapper.dart';
import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/UI/locked/screens/home_screen.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/boards/ManageBoards.dart';

class UnlockedMainBar extends StatelessWidget {
  final double scrollOffset;

  const UnlockedMainBar({
    Key key,
    this.scrollOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      color: light_purple_A100,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.folder,
                                color: paua,
                              ),
                              title: Text('Manage Boards'),
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ManageBoardsScreen()))
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.create_new_folder,
                                color: paua,
                              ),
                              title: Text('New Board'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.assignment,
                                color: paua,
                              ),
                              title: Text('Board 2'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.assignment,
                                color: paua,
                              ),
                              title: Text('Board 2'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  // padding: EdgeInsets.all(10.0),
                  child: Row(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Text(
                        'Board Name',
                        style: TextStyle(
                            color: paua,
                            fontSize: 16.0,
                            fontFamily: "Robotto",
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => print('Create'), // insert new screen here
                      child: Icon(
                        Icons.create,
                        color: paua,
                        size: 20.0,
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => print('Delete'), // insert new screen here
                      child: Icon(
                        Icons.delete,
                        color: paua,
                        size: 20.0,
                      ),
                    ),
                    // Setting
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => (Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SettingWrapper()))), // insert new screen here
                      child: Icon(
                        Icons.settings,
                        color: paua,
                        size: 20.0,
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        /// locked to unlocked transition
                        Provider.of<HomeModel>(context, listen: false)
                            .resetLock();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      data: defaultBoards,
                                      boardId: "root",
                                    )));
                      }, // insert new screen here
                      child: Icon(
                        Icons.lock_open,
                        color: paua,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
