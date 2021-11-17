import 'package:cboard_mobile/Providers/settings/settings.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/divider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Voice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingmodel = Provider.of<SettingsModel>(context);
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Voice'),
        appBar: AppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            RadioListTile<voice>(
                activeColor: pure_violet,
                title: Text("Female"),
                value: voice.Female,
                groupValue: settingmodel.voiceType,
                onChanged: (newVoice) => settingmodel.updateVoice(newVoice)),
            DividerLine(),
            RadioListTile<voice>(
                activeColor: pure_violet,
                title: Text("Male"),
                value: voice.Male,
                groupValue: settingmodel.voiceType,
                onChanged: (newVoice) => settingmodel.updateVoice(newVoice)),
            DividerLine(),
            RadioListTile<voice>(
                activeColor: pure_violet,
                title: Text("Robot"),
                value: voice.Robot,
                groupValue: settingmodel.voiceType,
                onChanged: (newVoice) => settingmodel.updateVoice(newVoice)),
            DividerLine(),
            RadioListTile<voice>(
                activeColor: pure_violet,
                title: Text("Funny"),
                value: voice.Funny,
                groupValue: settingmodel.voiceType,
                onChanged: (newVoice) => settingmodel.updateVoice(newVoice)),
          ],
        ),
      ),
    );
  }
}
