import 'package:cboard_mobile/Settings/Voice.dart';
import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Speech extends StatelessWidget {
  String route = "speech";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Speech'),
        appBar: AppBar(),
      ),
      body: Center(
        child: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidget createState() {
    return _MyStatefulWidget();
  }
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    var settingmodel = Provider.of<SettingsModel>(context);
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Dialect",
          ),
          subtitle: Text(settingmodel.voiceType.toString()),
        ),
        DividerLine(),
        ListTile(
            title: Text("Voice"),
            subtitle: Text(settingmodel.voiceType.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Voice()),
              );
            }),
        DividerLine(),
        Column(
          children: [
            ListTile(
              title: Text("Pitch"),
              subtitle:
                  Text("Make the voice use lower a higher or lower pitch"),
            ),
            Slider(
              activeColor: pure_violet,
              value: settingmodel.pitch,
              min: 0,
              max: 50,
              onChanged: (double newValue) {
                setState(() {
                  settingmodel.updatePitch(newValue);
                });
              },
            ),
          ],
        ),
        DividerLine(),
        Column(
          children: [
            ListTile(
              title: Text("Rate"),
              subtitle: Text("Make the voice speak faster or slower"),
            ),
            Slider(
              activeColor: pure_violet,
              value: settingmodel.rate,
              min: 0,
              max: 50,
              onChanged: (double newValue) {
                setState(() {
                  settingmodel.updateRate(newValue);
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
