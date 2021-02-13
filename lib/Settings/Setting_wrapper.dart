import 'package:cboard_mobile/Settings/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'routes.dart';

class Setting_wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings'),
          backgroundColor: Color(0xff23036A),
        ),
        body: MyStatefulWidget(),
      ),
      routes: getRoute(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidget createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  final sections = ['People', 'Language', 'System', 'Help'];
  final List<Map<String, List<Object>>> features = <Map<String, List<Object>>>[
    {
      'Guest': [Icons.account_circle]
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
      'Navigation': [Icons.chevron_right, '/speech']
    },
    {
      'User Help': [Icons.help, '/speech'],
      'About Cboard': [Icons.info, '/speech'],
      'Donate': [Icons.monetization_on, '/speech'],
      'Feedback': [Icons.feedback, '/speech']
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
              color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
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
                                features[index].values.elementAt(iconIndex)[1],
                                // arguments: null,
                              );
                            }
                          : null,
                      child: ListTile(
                        leading: Icon(
                          features[index].values.elementAt(iconIndex)[0],
                          color: Color(0xff391E75),
                          size: 20,
                        ),
                        title: Text(features[index].keys.elementAt(iconIndex)),
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
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: Text('LOGIN/SIGN UP',
                                    style: TextStyle(color: Color(0xff391E75))),
                              )
                            : null,
                      ),
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
