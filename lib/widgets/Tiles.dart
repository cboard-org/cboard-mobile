import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';

class Tiles extends StatelessWidget {
  final Tile tile;
  final double size;

  const Tiles({Key key, @required this.tile, @required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.86,
      height: 105,
      child: Card(
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 83.54,
                color: Color(0xffFFF6B1),
                child: Image.asset(
                  tile.imageUrl,
                  width: 104.86,
                ),
              ),
              Container(
                height: 21.44,
                child: Text(tile.name,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "Robotto",
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ],
          )),
    );
  }
}
