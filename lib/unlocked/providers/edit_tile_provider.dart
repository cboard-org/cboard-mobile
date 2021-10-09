import 'package:cboard_mobile/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditTileProvider extends ChangeNotifier{
  List<Tile> editList = [];

  addAllEditList(List<Tile> selectList){
    editList.clear();
    editList.addAll(selectList);
    notifyListeners();
  }


  editTile(){

  }

  createTile(){

  }



}