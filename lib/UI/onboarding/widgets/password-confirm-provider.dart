import 'package:flutter/material.dart';

class PasswordConfirmProvider extends ChangeNotifier {
  String _password = "";
  String _confirmPassword = "";

  String _name = "";
  String _email = "";

  String _language = "";
  String _country = "";

  void setNameText(String text) {
    _name = text;
  }

  void setEmailText(String text) {
    _email = text;
  }

  void setPasswordText(String text) {
    _password = text;
    notifyListeners();
  }

  void setPasswordConfirmText(String text) {
    _confirmPassword = text;
    notifyListeners();
  }

  void setLanguage(String text) {
    _language = text;
    notifyListeners();
  }

  void setCountry(String text) {
    _country = text;
    notifyListeners();
  }

  String get passwordText => _password;

  String get passwordConfirmText => _confirmPassword;

  String get nameText => _name;

  String get emailText => _email;

  String get languageText => _language;

  String get countryText => _country;
}
