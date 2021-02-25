import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  String
      _locale; // Not sure if this should be internal, outsourced, or implemented as a separate model

  String get locale => _locale;

  void updateLocale(String locale) {
    _locale = locale;
    notifyListeners();
  }
}
