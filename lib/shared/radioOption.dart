import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioOption extends StatelessWidget {
  String title;
  String subtitle;
  size groupState;
  void Function(size) onChange;

  RadioOption(
      String title, String subtitle, size groupState, Function(size) onChange) {
    this.title = title;
    this.subtitle = subtitle;
    this.groupState = groupState;
    this.onChange = onChange;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14)),
          Text(subtitle, style: TextStyle(fontSize: 12, color: dark_gray)),
          Row(
            children: [
              Expanded(
                  child: Column(children: [
                Radio(
                    activeColor: pure_violet,
                    value: size.Standard,
                    groupValue: groupState,
                    onChanged: onChange),
                Text("Standard",
                    style: TextStyle(fontSize: 12, color: dark_gray))
              ])),
              Expanded(
                  child: Column(children: [
                Radio(
                    activeColor: pure_violet,
                    value: size.Large,
                    groupValue: groupState,
                    onChanged: onChange),
                Text("Large", style: TextStyle(fontSize: 12, color: dark_gray))
              ])),
              Expanded(
                  child: Column(children: [
                Radio(
                    activeColor: pure_violet,
                    value: size.ExtraLarge,
                    groupValue: groupState,
                    onChanged: onChange),
                Text("Extra large",
                    style: TextStyle(fontSize: 12, color: dark_gray))
              ])),
            ],
          ),
        ],
      ),
    );
  }
}
