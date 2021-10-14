import 'package:cboard_mobile/Settings/routes.dart';
import 'package:cboard_mobile/app_localizations.dart';
import 'package:cboard_mobile/models/settings.dart';
// import 'package:cboard_mobile/shared/Themes.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/Settings/Feedback.dart' as feedback;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import '../shared/button.dart';
import 'routes.dart';

class SettingWrapper extends StatelessWidget {
  // ThemeNotifier theme = new ThemeNotifier();
  //Idea: The whole screen is ListView with each item is a section [People,Language,System,Help]. Each section is a ListView with each item is a ListTile.
  final Map<String, Map<String, SettingListItem>> section = {
    'settings_people': {'settings_people_Guest': new SettingListItem(Icons.account_circle, '/welcome')},
    'settings_language': {
      'settings_language_Language': new SettingListItem(Icons.language, '/language'),
      'settings_language_Speech': new SettingListItem(Icons.record_voice_over, '/speech')
    },
    'settings_system': {
      'settings_system_Export': new SettingListItem(Icons.cloud_upload, '/export'),
      'settings_system_Import': new SettingListItem(Icons.cloud_download, '/import'),
      'settings_system_Display': new SettingListItem(Icons.remove_red_eye, '/display'),
      'settings_system_Scanning': new SettingListItem(Icons.center_focus_strong, '/scanner'),
      'settings_system_Navigation': new SettingListItem(Icons.chevron_right, '/navigation')
    },
    'settings_help': {
      'settings_help_UserHelp': new SettingListItem(Icons.help, '/user help'),
      'settings_help_AboutCboard': new SettingListItem(Icons.info, '/about'),
      'settings_help_Donate': new SettingListItem(Icons.monetization_on, '/donate'),
      'settings_help_Feedback': new SettingListItem(Icons.feedback, '/feedback')
    }
  };
  @override
  Widget build(BuildContext context) {
    var settingModel = Provider.of<SettingsModel>(context);
    FlutterTts tts = new FlutterTts();
    var _langs;

    Future _fetchLanguages() async{
      _langs = await tts.getLanguages;
    }

    List<Locale> _getSupportedLanguages(){
      List<Locale> languages = [];
      _fetchLanguages();
      for(var lang in _langs){
        languages.add(lang);
      }
      return languages;
    }

    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingsModel(),
      child: MaterialApp(
        routes: getRoute(),
        supportedLocales: _getSupportedLanguages(),
        locale: settingModel.locale,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales){
          for(var supportedLocale in supportedLocales){
            if(supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode){
              return supportedLocale;
            }
          }
          return Locale('en', 'US');
        },
        theme: ThemeData(
          primaryColor: paua,
          accentColor: fog,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
        ),
        // themeMode: ThemeMode.system,
        // theme: Themes.lightTheme,
        // darkTheme: Themes.darkTheme,
        home: Scaffold(
            backgroundColor: mercury,
            // Theme.of(context) == Themes.lightTheme
            //     ? mercury
            //     : Color(0xFF424242),
            appBar: BaseAppBar(
              title: Text(
                "Settings",
              ),
              appBar: AppBar(),
            ),
            body: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: section.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: new BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(5.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate(section.keys.elementAt(index)),
                        textAlign: TextAlign.left,
                      ),
                      (index ==
                              0) //checking if the section is 'People'. Only 'People' is a ListTile itself with onTap button is the 'LOGIN/SIGN UP'
                          ? ListTile(
                              leading: Icon(
                                section.values
                                    .elementAt(0)
                                    .values
                                    .elementAt(0)
                                    .icon,
                                color: dark_violet,
                              ),
                              title: Text(AppLocalizations.of(context).translate(section.values.elementAt(0).keys.elementAt(0))),
                              trailing: Button(
                                padding: 9,
                                label: Text(AppLocalizations.of(context).translate("settings_login_button")),
                                isPrimary: false,
                                onPress: () {
                                  Navigator.of(context).pushNamed(section.values
                                      .elementAt(0)
                                      .values
                                      .elementAt(0)
                                      .route);
                                },
                              ))
                          : ListView.separated(
                              separatorBuilder: (BuildContext context,
                                      int index) =>
                                  Divider(color: Color(0xffE0E0E0), indent: 78),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: section.values.elementAt(index).length,
                              itemBuilder:
                                  (BuildContext context, int iconIndex) {
                                return ListTile(
                                    onTap: () {
                                      String routeName = section.values
                                          .elementAt(index)
                                          .values
                                          .elementAt(iconIndex)
                                          .route;

                                      if (routeName == "/feedback") {
                                        feedback.Feedback.launchEmail();
                                      } else {
                                        Navigator.of(context)
                                            .pushNamed(routeName);
                                      }
                                    },
                                    leading: Icon(
                                      section.values
                                          .elementAt(index)
                                          .values
                                          .elementAt(iconIndex)
                                          .icon,
                                      color: dark_violet,
                                      size: 20,
                                    ),
                                    title: Text(
                                      AppLocalizations.of(context).translate(section.values
                                          .elementAt(index)
                                          .keys
                                          .elementAt(iconIndex))
                                    ));
                              }),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}

class SettingListItem {
  IconData icon;
  String route;
  SettingListItem(IconData iconNew, String routeNew) {
    this.icon = iconNew;
    this.route = routeNew;
  }
}
