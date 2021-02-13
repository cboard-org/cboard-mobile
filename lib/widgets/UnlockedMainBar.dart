import 'package:flutter/material.dart';

class UnlockedMainBar extends StatelessWidget {
  final double scrollOffset;

  const UnlockedMainBar({
    Key key,
    this.scrollOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      color: Color(0xffF2E7FE),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.folder,
                                color: Color(0xff23036A),
                              ),
                              title: Text('Manage Boards'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.create_new_folder,
                                color: Color(0xff23036A),
                              ),
                              title: Text('New Board'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.assignment,
                                color: Color(0xff23036A),
                              ),
                              title: Text('Board 2'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.assignment,
                                color: Color(0xff23036A),
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
                            color: Color(0xff23036A),
                            fontSize: 16.0,
                            fontFamily: "Robotto",
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_drop_down),
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
                        color: Color(0xff23036A),
                        size: 20.0,
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => print('Delete'), // insert new screen here
                      child: Icon(
                        Icons.delete,
                        color: Color(0xff23036A),
                        size: 20.0,
                      ),
                    ),
                    // Setting
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => print('Settings'), // insert new screen here
                      child: Icon(
                        Icons.settings,
                        color: Color(0xff23036A),
                        size: 20.0,
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => print('Lock'), // insert new screen here
                      child: Icon(
                        Icons.lock_open,
                        color: Color(0xff23036A),
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
