import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/lockedScreen/screens/home_screen.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel()),
        //Add Provider Listener to any change in edit_dialog
        ChangeNotifierProvider<DialogModel>(create: (context) => DialogModel())
      ],
      child: MaterialApp(
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
            contentPadding: new EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
