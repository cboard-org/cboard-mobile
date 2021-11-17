import 'package:cboard_mobile/models/data/data_unlocked.dart';
import 'package:flutter/material.dart';

class UnlockedHomeProvider extends ChangeNotifier {
  List<String> navigation = [];
  bool selectMode = false;
  List<Tile> hideList = [];
  Map<String, Tile> selectList = {};

  switchSelectionMode() {
    selectMode = !selectMode;
    clearSelect();
    notifyListeners();
  }

  addToSelect(Tile tile) {
    selectList[tile.name] = tile;
    notifyListeners();
  }

  removeFromSelect(Tile tile) {
    selectList.remove(tile.name);
    notifyListeners();
  }

  clearSelect() {
    selectList.clear();
    notifyListeners();
  }

  selectAll(List<Tile> tileList) {
    tileList.forEach((tile) {
      selectList[tile.name] = tile;
    });
    notifyListeners();
  }

  addToNavigation(String folderName) {
    navigation.add(folderName);
    notifyListeners();
  }

  removeNavigation(String folderName) {
    navigation.removeRange(
        navigation.lastIndexOf(folderName), navigation.length - 1);
    notifyListeners();
  }

  popNavigation() {
    navigation.removeLast();
    notifyListeners();
  }

  String prettyNavigation() {
    String t = "";
    navigation?.forEach((element) {
      t = t + element + " > ";
    });
    return t;
  }
}
