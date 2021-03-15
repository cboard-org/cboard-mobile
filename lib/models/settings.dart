import 'package:cboard_mobile/models/locale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  String _language;
  String _locale;

  String get language => _language;
  String get locale => _locale;

  void updateLocale(String language) {
    _language = language;
    _locale = LocaleModel.languageMap[language];
    notifyListeners();
  }
}
