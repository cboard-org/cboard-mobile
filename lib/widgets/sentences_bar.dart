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
    return // Sentence Area
        Container(
      height: 100.0,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Expanded(
            child: SizedBox(
              // height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: example.length,
                itemBuilder: (BuildContext context, int index) {
                  final Tile tile = example[index];
                  return Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => print(tile.name),
                        child: SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(tile.imageUrl),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(tile.name, textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  );
                },
              ),
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
