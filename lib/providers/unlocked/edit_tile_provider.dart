import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/models/data/data_unlocked.dart';
import 'package:flutter/cupertino.dart';

class EditTileProvider extends ChangeNotifier {
  List<TileModel> editList = [];

  addAllEditList(List<TileModel> selectList) {
    editList.clear();
    editList.addAll(selectList);
    notifyListeners();
  }

  editTile() {}

  createTile() {}
}
