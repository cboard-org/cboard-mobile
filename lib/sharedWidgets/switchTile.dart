import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  String title;
  String subTitle;
  bool value;
  void Function(bool) onChange;

  SwitchTile(
      String title, String subTitle, bool value, Function(bool) onChange) {
    this.title = title;
    this.subTitle = subTitle;
    this.value = value;
    this.onChange = onChange;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: pure_violet,
      title: Text(title, style: TextStyle(fontSize: 14, color: Colors.black)),
      subtitle:
          Text(subTitle, style: TextStyle(fontSize: 12, color: dark_gray)),
      value: this.value,
      onChanged: onChange,
    );
  }
}
