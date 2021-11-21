import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class Data {
  final String name;
  final String content;
  final Color color;

  Data(this.name, this.content, this.color);
}

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

// class Tile {
//   String name;
//   String imageUrl;
//   bool isFolder;
//   String vocalization;
//   bool isRecording;
//   String recordingPath;
//   String backgroundColor;
//   String textColor;
//   List<Tile> tiles;
//
//   Tile({
//     @required this.name,
//     this.isFolder=false,
//     this.isRecording,
//     this.imageUrl,
//     this.recordingPath,
//     this.vocalization,
//     this.backgroundColor = "E0F1BC",
//     this.textColor = "000000",
//     this.tiles
//   });
//
// //
// }
//
// final List<Tile> example1 = [
//   Tile(name: 'A', imageUrl: 'assets/symbols/A.svg', isFolder: false),
//   Tile(name: 'B', imageUrl: 'assets/symbols/B.svg',isFolder: false),
//   Tile(name: 'Animal', imageUrl:  'assets/symbols/dolphin.svg',
//       backgroundColor: "D2ABFF",
//       isFolder: true,
//       tiles: [
//         Tile(name: 'dolphin', imageUrl: 'assets/symbols/dolphin.svg'),
//         Tile(name: 'fish',imageUrl: 'assets/symbols/fish.svg'),
//         Tile(name: 'whale',imageUrl: 'assets/symbols/killer_whale.svg'),
//         Tile(name: 'polar bear',imageUrl: 'assets/symbols/polar_bear.svg'),
//       ]),
// ];
