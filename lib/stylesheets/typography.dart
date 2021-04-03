import 'package:flutter/material.dart';

import 'constants.dart';

class Typography {
  static TextStyle header() {
    return TextStyle(
        color: mine_shaft, fontSize: 20, fontWeight: FontWeight.bold);
  }

  static TextStyle subheader() {
    return TextStyle(color: mine_shaft, fontSize: 15);
  }

  static TextStyle label() {
    return TextStyle(color: electric_violet);
  }

  static TextStyle description() {
    return TextStyle();
  }
}
