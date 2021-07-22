import 'package:cboard_mobile/Settings/routes.dart';
import 'package:cboard_mobile/models/settings.dart';
// import 'package:cboard_mobile/shared/Themes.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/Settings/Feedback.dart' as feedback;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../shared/button.dart';
import 'routes.dart';

class SettingWrapper extends StatelessWidget {
  // ThemeNotifier theme = new ThemeNotifier();
  //Idea: The whole screen is ListView with each item is a section [People,Language,System,Help]. Each section is a ListView with each item is a ListTile.
  final Map<String, Map<String, SettingListItem>> section = {
    'People': {'Guest': new SettingListItem(Icons.account_circle, '/welcome')},
    'Language': {
      'Language': new SettingListItem(Icons.language, '/language'),
      'Speech': new SettingListItem(Icons.record_voice_over, '/speech')
    },
    'System': {
      'Export': new SettingListItem(Icons.cloud_upload, '/export'),
      'Import': new SettingListItem(Icons.cloud_download, '/import'),
      'Display': new SettingListItem(Icons.remove_red_eye, '/display'),
      'Scanning': new SettingListItem(Icons.center_focus_strong, '/scanner'),
      'Navigation': new SettingListItem(Icons.chevron_right, '/navigation')
    },
    'Help': {
      'User Help': new SettingListItem(Icons.help, '/user help'),
      'About Cboard': new SettingListItem(Icons.info, '/about'),
      'Donate': new SettingListItem(Icons.monetization_on, '/donate'),
      'Feedback': new SettingListItem(Icons.feedback, '/feedback')
    }
  };
  @override
  Widget build(BuildContext context) {
    // var settingModel = Provider.of<SettingsModel>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingsModel(),
      child: MaterialApp(
        routes: getRoute(),
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
              title: Text('Settings'),
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
                        section.keys.elementAt(index),
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
                              title: Text(section.values
                                  .elementAt(0)
                                  .keys
                                  .elementAt(0)),
                              trailing: Button(
                                padding: 9,
                                label: Text('LOGIN/SIGN UP'),
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
                                      section.values
                                          .elementAt(index)
                                          .keys
                                          .elementAt(iconIndex),
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