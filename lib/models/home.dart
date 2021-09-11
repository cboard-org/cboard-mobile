import 'package:cboard_mobile/lockedScreen/data/data.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  List<TileData> words = [];
  String fullSent = "";

  void addWords(TileData newWord) {
    words.add(newWord);
    fullSent += newWord.name + ". ";
    notifyListeners();
  }

  List<TileData> getWords() {
    return words;
  }

  void removeWords() {
    if (words.length > 0) {
      fullSent =
          fullSent.substring(0, fullSent.length - words.last.name.length - 2);
      words.removeLast();
    }
    notifyListeners();
  }

  String getFullSent() {
    return fullSent;
  }
}
