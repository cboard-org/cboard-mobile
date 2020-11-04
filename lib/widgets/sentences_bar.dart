import 'package:flutter/material.dart';
import 'widgets.dart';

class SentenceBar extends StatefulWidget {
  @override
  _SentenceBarState createState() => _SentenceBarState();
}

class _SentenceBarState extends State<SentenceBar> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return // Sentence Area
        Container(
      height: 100.0,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          // Container of tiles (currently only fillers)
          Container(
            // color: Colors.blue, // debug: check container title space
            width: screenSize.width - 60,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 80.0,
                  height: 80.0,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          // Backspace Button
          GestureDetector(
            onTap: () => print('Backspace'),
            child: Icon(
              Icons.backspace,
              color: Theme.of(context).primaryColor,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
