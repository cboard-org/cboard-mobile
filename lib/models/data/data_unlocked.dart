import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Data {
  final String name;
  final String content;
  String backgroundColor;
  String textColor;

  Data(
      {@required this.name,
      @required this.content,
      this.backgroundColor = "E0F1BC",
      this.textColor = "000000"});
}

class Tile {
  String name;
  String imageUrl;
  bool isFolder;
  String vocalization;
  bool isRecording;
  String recordingPath;
  String backgroundColor;
  String textColor;
  List<Tile> tiles;

  Tile(
      {@required this.name,
      this.isFolder = false,
      this.isRecording,
      this.imageUrl,
      this.recordingPath,
      this.vocalization,
      this.backgroundColor = "E0F1BC",
      this.textColor = "000000",
      this.tiles});
// Tile.fromJson(Map<String,dynamic> json){
//   Map<String,dynamic> json1 = {
//     "labelKey": "symbol.foodMealsAndSnacks.soup",
//     "image": "/symbols/mulberry/soup.svg",
//     "loadBoard": "SkEF6D2DaW",
//     "id": "rkCHGA9TQ5F-",
//     "backgroundColor": "rgb(187, 222, 251)"
//   };
//   imageUrl = json["image"];
//   backgroundColor = json["backgroundColor"];
//   isFolder = json["loadBoard"] != null;
//
// }
}

final List<Tile> example1 = [
  Tile(name: 'A', imageUrl: 'assets/symbols/A.svg', isFolder: false),
  Tile(name: 'B', imageUrl: 'assets/symbols/B.svg', isFolder: false),
  Tile(
      name: 'Animal',
      imageUrl: 'assets/symbols/dolphin.svg',
      backgroundColor: "D2ABFF",
      isFolder: true,
      tiles: [
        Tile(name: 'dolphin', imageUrl: 'assets/symbols/dolphin.svg'),
        Tile(name: 'fish', imageUrl: 'assets/symbols/fish.svg'),
        Tile(name: 'whale', imageUrl: 'assets/symbols/killer_whale.svg'),
        Tile(name: 'polar bear', imageUrl: 'assets/symbols/polar_bear.svg'),
      ]),
];
