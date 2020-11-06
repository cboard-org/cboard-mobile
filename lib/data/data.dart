import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Tile {
  final String name;
  final String imageUrl;
  final bool isFile;

  const Tile({
    @required this.name,
    @required this.isFile,
    this.imageUrl,
  });
}

final List<Tile> example = const [
  Tile(name: 'Back', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(name: 'Test', isFile: true, imageUrl: 'assets/images/test.png'),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'cboard-mobile/assets/images/test.png'),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'cboard-mobile/assets/images/test.png'),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'cboard-mobile/assets/images/test.png'),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'cboard-mobile/assets/images/test.png'),
];
