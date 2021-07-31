import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/models/settings.dart';
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
