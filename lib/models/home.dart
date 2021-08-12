import 'package:cboard_mobile/data/data.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  List<TileData> words = [];
  void add(TileData newWord) {
    words.add(newWord);
    notifyListeners();
  }

  List<TileData> getWords() {
    return words;
  }
}
