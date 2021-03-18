import 'package:cboard_mobile/Settings/routes.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../shared/button.dart';
import 'routes.dart';

class SettingWrapper extends StatelessWidget {
  // ThemeNotifier theme = new ThemeNotifier();
  final Map<String, Map<String, List<Object>>> section = {
    'People': {
      'Guest': [Icons.account_circle, '/welcome']
    },
    'Language': {
      'Language': [Icons.language, '/speech'],
      'Speech': [Icons.record_voice_over, '/speech']
    },
    'System': {
      'Export': [Icons.cloud_upload, '/speech'],
      'Import': [Icons.cloud_download, '/speech'],
      'Display': [Icons.remove_red_eye, '/display'],
      'Scanning': [Icons.center_focus_strong, '/speech'],
      'Navigation': [Icons.chevron_right, '/navigation']
    },
    'Help': {
      'User Help': [Icons.help, '/user help'],
      'About Cboard': [Icons.info, '/about'],
      'Donate': [Icons.monetization_on, '/speech'],
      'Feedback': [Icons.feedback, '/speech']
    }
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getRoute(),
      theme: ThemeData(
        primaryColor: Color(0xFF23036A),
        accentColor: Color(0xFFE3CAFF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.keys.elementAt(index),
                      textAlign: TextAlign.left,
                    ),
                    (index == 0)
                        ? ListTile(
                            leading: Icon(
                              section.values
                                  .elementAt(0)
                                  .values
                                  .elementAt(0)[0],
                              color: Color(0xff391E75),
                              size: 20,
                            ),
                            title: Text(
                                section.values.elementAt(0).keys.elementAt(0)),
                            trailing: Button(
                              padding: 9,
                              label: Text('LOGIN/SIGN UP'),
                              isPrimary: false,
                              onPress: () {
                                Navigator.of(context).pushNamed(section.values
                                    .elementAt(0)
                                    .values
                                    .elementAt(0)[1]);
                              },
                            ))
                        : ListView.separated(
                            separatorBuilder: (BuildContext context,
                                    int index) =>
                                Divider(color: Color(0xffE0E0E0), indent: 78),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: section.values.elementAt(index).length,
                            itemBuilder: (BuildContext context, int iconIndex) {
                              return ListTile(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(section
                                        .values
                                        .elementAt(index)
                                        .values
                                        .elementAt(iconIndex)[1]);
                                  },
                                  leading: Icon(
                                    section.values
                                        .elementAt(index)
                                        .values
                                        .elementAt(iconIndex)[0],
                                    color: Color(0xff391E75),
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
    );
  }
}
