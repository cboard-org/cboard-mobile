import 'package:cboard_mobile/screens/onboarding/welcome.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C-Board Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: paua,
        accentColor: fog,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: white,
      ),
      home: Welcome(),
    );
  }
}
