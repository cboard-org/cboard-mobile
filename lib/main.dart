import 'package:cboard_mobile/unlocked/widgets/UnlockedMainBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      home: UnlockedMainBar(), // debug: change back to homescreen
    );
  }
}
