

import 'package:flutter/material.dart';

class ManageBoard extends ChangeNotifier{
  String _boardName;
  String _availability;
  int _layout;
  bool _saveToCloud = false;

  //getters
  String get boardName => _boardName;
  String get availability => _availability;
  int get layout => _layout;
  bool get saveToCloud => _saveToCloud;

  //setters
  void updateBoardName(String name) {
    _boardName = name;
    notifyListeners();
  }

  void updateAvail(String val) {
    _availability = val;
    notifyListeners();
  }

  void changeLayout(int newVal) {
    _layout = newVal;
    notifyListeners();
  }

  void toggleSaveCloud(bool val) {
    _saveToCloud = val;
    notifyListeners();
  }
}