import 'package:cboard_mobile/Settings/SettingWrapper.dart';
import 'package:cboard_mobile/lockedScreen/data/data.dart';
import 'package:cboard_mobile/lockedScreen/screens/home_screen.dart';
import 'package:cboard_mobile/models/dialog.dart';
import 'package:cboard_mobile/models/home.dart';
import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/lockedScreen/screens/home_screen.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/dialog.dart';
import 'models/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel()),
        //Add Provider Listener to any change in edit_dialog
        ChangeNotifierProvider<DialogModel>(create: (context) => DialogModel()),
        ChangeNotifierProvider<HomeModel>(create: (context) => HomeModel()),
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
        home: HomeScreen(data: example),
      ),
    );
  }
}
