import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class Data {
  final String name;
  final String content;
  final Color color;

  Data(this.name, this.content, this.color);
}

/*
final List<Tile> example = const [
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
];
*/

class TileData extends Data {
  TileData(String name, String content, Color color)
      : super(name, content, color);
}

class FolderData extends Data {
  final List<TileData> tiles;
  FolderData(String name, String content, Color color, this.tiles)
      : super(name, content, color);
}

List<Data> example = [
  TileData('A', 'assets/symbols/A.svg', dark_lime_green),
  TileData('B', 'assets/symbols/B.svg', dark_lime_green),
  FolderData('Animal', 'assets/symbols/dolphin.svg', dark_lime_green, [
    TileData('dolphin', 'assets/symbols/dolphin.svg', dark_lime_green),
    TileData('fish', 'assets/symbols/fish.svg', dark_lime_green),
    TileData('whale', 'assets/symbols/killer_whale.svg', dark_lime_green),
    TileData('polar bear', 'assets/symbols/polar_bear.svg', dark_lime_green),
  ]),
];

