import 'package:cboard_mobile/providers/locked/dialog.dart';
import 'package:cboard_mobile/providers/locked/home.dart';
import 'package:cboard_mobile/providers/settings/settings.dart';
import 'package:cboard_mobile/providers/unlocked/edit_tile_provider.dart';
import 'package:cboard_mobile/providers/unlocked/unlocked_home_provider.dart';
import 'package:cboard_mobile/UI/onboarding/screens/welcome.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/password-confirm-provider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/locked/dialog.dart';
import 'providers/locked/home.dart';
import 'app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlutterTts tts = new FlutterTts();
    // var _langs;

    // Future _fetchLanguages() async{
    //   _langs = await tts.getLanguages;
    // }

    // List<Locale> _getSupportedLanguages(){
    //   List<Locale> languages = [];
    //   _fetchLanguages();
    //   for(var lang in _langs){
    //     languages.add(lang);
    //   }
    //   if(languages == null){
    //     languages.add(Locale('en', 'US'));
    //   }
    //   return languages;
    // }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel()),
        //Add Provider Listener to any change in edit_dialog
        ChangeNotifierProvider<DialogModel>(create: (context) => DialogModel()),
        ChangeNotifierProvider<HomeModel>(create: (context) => HomeModel()),
        ChangeNotifierProvider(create: (context) => PasswordConfirmProvider()),
        //Add Provider Listener to any change in edit_dialog
        ChangeNotifierProvider<EditTileProvider>(
            create: (context) => EditTileProvider()),
        ChangeNotifierProvider<UnlockedHomeProvider>(
            create: (context) => UnlockedHomeProvider()),

      ],
      child: MaterialApp(
        title: 'C-Board Mobile',
        // This list should be fetched from the languages supported by the TTS (Google/Samsung)
        supportedLocales: [Locale('en', 'US')],
        // This locale should be fetched from provider
        locale: Locale('en', 'US'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return Locale('en', 'US');
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: paua,
          accentColor: fog,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: white,
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
        home: Welcome(),
        // home: TrialApp(),
      ),
    );
  }
}
