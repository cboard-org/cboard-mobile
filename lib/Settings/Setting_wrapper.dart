import 'package:cboard_mobile/Settings/routes.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../shared/button.dart';
import 'routes.dart';

class Setting_wrapper extends StatelessWidget {
  // ThemeNotifier theme = new ThemeNotifier();
  final sections = ['People', 'Language', 'System', 'Help'];
  final List<Map<String, List<Object>>> features = <Map<String, List<Object>>>[
    {
      'Guest': [Icons.account_circle, '/welcome']
    },
    {
      'Language': [Icons.language, '/speech'],
      'Speech': [Icons.record_voice_over, '/speech']
    },
    {
      'Export': [Icons.cloud_upload, '/speech'],
      'Import': [Icons.cloud_download, '/speech'],
      'Display': [Icons.remove_red_eye, '/display'],
      'Scanning': [Icons.center_focus_strong, '/speech'],
      'Navigation': [Icons.chevron_right, '/navigation']
    },
    {
      'User Help': [Icons.help, '/user help'],
      'About Cboard': [Icons.info, '/about'],
      'Donate': [Icons.monetization_on, '/speech'],
      'Feedback': [Icons.feedback, '/speech']
    },
  ];
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
            itemCount: sections.length,
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
                      sections[index],
                      textAlign: TextAlign.left,
                    ),
                    ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(color: Color(0xffE0E0E0), indent: 78),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: features[index].length,
                        itemBuilder: (BuildContext context, int iconIndex) {
                          return GestureDetector(
                            onTap: index != 0
                                ? () {
                                    Navigator.of(context).pushNamed(
                                      features[index]
                                          .values
                                          .elementAt(iconIndex)[1],
                                    );
                                  }
                                : null,
                            child: ListTile(
                              leading: Icon(
                                features[index].values.elementAt(iconIndex)[0],
                                color: Color(0xff391E75),
                                size: 20,
                              ),
                              title: Text(
                                  features[index].keys.elementAt(iconIndex)),
                              trailing: (index == 0)
                                  ? Container(
                                      width: 121,
                                      height: 27,
                                      alignment: Alignment.center,
                                      decoration: new BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff6200EE)),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100.0)),
                                      child: Button(
                                        label: Text('LOGIN/SIGN UP'),
                                        isPrimary: false,
                                        onPress: () {
                                          Navigator.of(context).pushNamed(
                                            features[index]
                                                .values
                                                .elementAt(iconIndex)[1],
                                          );
                                        },
                                      ),
                                    )
                                  : null,
                            ),
                          );
                        }),
                  ],
                ),
              );
            },
          )),
    );
  }
}
