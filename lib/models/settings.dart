import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  String _locale;

  String get locale => _locale;

  void updateLocale(String locale) {
    _locale = locale;
    notifyListeners();
  }
}
