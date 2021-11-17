import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Text label;
  final double padding;
  final bool isPrimary;
  final VoidCallback onPress;

  const Button(
      {Key key,
      this.label,
      this.padding = 30,
      this.isPrimary = true,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: label,
      color: isPrimary ? paua : Colors.transparent,
      textColor: isPrimary ? white : paua,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: paua),
      ),
      padding: EdgeInsets.symmetric(horizontal: padding),
      onPressed: onPress,
    );
  }
}
