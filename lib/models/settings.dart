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

  size get uiSize => _uiSize;

  void updateUiSize(size newSize) {
    _uiSize = newSize;
    notifyListeners();
  }

  String get locale => _locale;

  void updateLocale(String locale) {
    _locale = locale;
    notifyListeners();
  }
}
