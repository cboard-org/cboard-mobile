import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';

enum labelSize { Small, Medium, Large, Extra_large }

//To manage screen of edit dialogs
class DialogModel with ChangeNotifier {
  int _currentState = 1;
  Color _tileTextColor = dark_blue;
  Color _tileBackgroundColor = dark_lime_green;
  Color _folderTextColor = dark_blue;
  Color _folderBackgroundColor = dark_blue;
  labelSize _tileLabelSizeOption = labelSize.Large;
  labelSize _folderLabelSizeOption = labelSize.Large;
  bool _labelTop = false;

  labelSize get currentTileLabelSize => _tileLabelSizeOption;
  void updateTileLabelSize(labelSize newSize) {
    _tileLabelSizeOption = newSize;
    notifyListeners();
  }

  labelSize get currentFolderLabelSize => _folderLabelSizeOption;
  void updateFolderLabelSize(labelSize newSize) {
    _folderLabelSizeOption = newSize;
    notifyListeners();
  }

  int get currentState => _currentState;
  void updateState(int newState) {
    _currentState = newState;
    notifyListeners();
  }

  Color get tileTextColor => _tileTextColor;
  void updateTileTextColor(Color newColor) {
    _tileTextColor = newColor;
    notifyListeners();
  }

  Color get tileBackgroundColor => _tileBackgroundColor;
  void updateTileBackgroundColor(Color newColor) {
    _tileBackgroundColor = newColor;
    notifyListeners();
  }

  Color get folderTextColor => _folderTextColor;
  void updateFolderTextColor(Color newColor) {
    _folderTextColor = newColor;
    notifyListeners();
  }

  Color get folderBackgroundColor => _folderBackgroundColor;
  void updateFolderBackgroundColor(Color newColor) {
    _folderBackgroundColor = newColor;
    notifyListeners();
  }

  bool get labelTop => _labelTop;
  void updatelabelPos(bool newPos) {
    _labelTop = newPos;
    notifyListeners();
  }
}
