import 'package:cboard_mobile/models/data/data_unlocked.dart';
import 'package:flutter/cupertino.dart';

class EditTileProvider extends ChangeNotifier {
  List<Tile> editList = [];

  addAllEditList(List<Tile> selectList) {
    editList.clear();
    editList.addAll(selectList);
    notifyListeners();
  }

  editTile() {}

  createTile() {}
}
