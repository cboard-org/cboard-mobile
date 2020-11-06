import 'package:cboard_mobile/data/data.dart';
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
    return Row(
      children: [
        SizedBox(width: 3.0),
        Container(
          // alignment: Alignment.centerRight,
          height: 100.0,
          width: screenSize.width - 45,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: example.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final Tile tile = example[index];
              return CreateTile(tile: tile);
            },
          ),
        ),
        SizedBox(width: 5.0),
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
    );
  }
}
