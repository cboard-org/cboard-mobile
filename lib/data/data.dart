import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Tile {
  final String name;
  final String imageUrl;
  final bool isFile;
  final String vocalization;
  final String editName;
  final bool voiceRecorder;

  const Tile({
    @required this.name,
    @required this.isFile,
    @required this.voiceRecorder,
    this.editName,
    this.imageUrl,
    this.vocalization,
  });
}

final List<Tile> example = const [
  Tile(
      name: 'Test2',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test2',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test2',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Test',
      isFile: true,
      imageUrl: 'assets/images/test.png',
      vocalization: 'Test Vocal',
      voiceRecorder: true),
  Tile(
      name: 'Label',
      editName: 'Please enter name',
      isFile: true,
      imageUrl: 'assets/images/empty.png',
      vocalization: 'Subtitle 1',
      voiceRecorder: true),
];
