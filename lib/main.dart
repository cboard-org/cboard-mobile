import 'package:cboard_mobile/Settings/Display.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'Settings/Setting_wrapper.dart';
import 'Settings/Speech.dart';
import 'Settings/Display.dart';

void main() {
  runApp(Setting_wrapper());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C-Board Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF23036A),
        accentColor: Color(0xFFE3CAFF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: EditTileScreen(), // debug: change back to homescreen
    );
  }
}
