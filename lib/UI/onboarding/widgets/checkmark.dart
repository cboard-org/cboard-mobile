import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class Checkmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: electric_violet),
      child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Icon(
            Icons.check,
            size: 20.0,
            color: Colors.white,
          )),
    );
  }
}
