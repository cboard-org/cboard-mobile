import 'package:cboard_mobile/data/data.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {
  List<TileData> words = [];
  String fullSent = "";

  void addWords(TileData newTile) {
    words.add(newTile);
    //For adding sentence to top bar
    // String newWord = newTile.name != "Edit" ? newTile.name : newTile.content;
    String newWord = newTile.labelKey.split('.').last;
    fullSent += newWord + ". ";
    print(fullSent);
    notifyListeners();
  }

  List<TileData> getWords() {
    return words;
  }

  void removeWords() {
    if (words.length > 0) {
      fullSent = fullSent.substring(
          0, fullSent.length - words.last.labelKey.split('.').last.length - 2);
      words.removeLast();
    }
    notifyListeners();
  }

  String getFullSent() {
    return fullSent;
  }
}
