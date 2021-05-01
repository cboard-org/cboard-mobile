import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum size { Standard, Large, ExtraLarge }

class SettingsModel extends ChangeNotifier {
  String _locale;

  bool _darkTheme = false;

  bool _predictiveText = false;

  bool _outputBar = false;

  size _uiSize = size.Standard;

  size _fontSize = size.Standard;

  //Getters
  String get locale => _locale;
  bool get darkTheme => _darkTheme;
  bool get predictiveText => _predictiveText;
  bool get outputBar => _outputBar;
  size get uiSize => _uiSize;
  size get fontSize => _fontSize;

  //Setters
  void updateLocale(String locale) {
    _locale = locale;
    notifyListeners();
  }

  void updateDarkTheme(bool newVal) {
    _darkTheme = newVal;
    notifyListeners();
  }

  void updatePredictiveText(bool newVal) {
    _predictiveText = newVal;
    notifyListeners();
  }

  void updateOutputBar(bool newVal) {
    _outputBar = newVal;
    notifyListeners();
  }

  void updateUiSize(size newSize) {
    _uiSize = newSize;
    notifyListeners();
  }

  void updateFontSize(size newSize) {
    _fontSize = newSize;
    notifyListeners();
  }
}
