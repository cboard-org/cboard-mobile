import 'package:cboard_mobile/onboarding/screens/welcome.dart';
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
        scaffoldBackgroundColor: mercury,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: electric_violet),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: electric_violet),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: electric_violet),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: electric_violet),
          ),
          labelStyle: TextStyle(color: electric_violet),
          contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        ),
      ),
      home: Welcome(),
    );
  }
}
