import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/onboarding/screens/select-voice.dart';
import 'package:cboard_mobile/onboarding/widgets/TTS-dialog.dart';
import 'package:cboard_mobile/onboarding/widgets/header-user.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpTTS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = context.read<SettingsModel>().locale;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Install TTS'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Container(
            child: UserHeader(shouldSetPhoto: false, locale: locale),
            margin: EdgeInsets.only(bottom: 3),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'STEP 1',
                    style: CustomTypography.Typography.label(),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: CustomTypography.Typography.description(),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            color: white,
            margin: EdgeInsets.only(bottom: 3),
            padding: EdgeInsets.all(15),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'STEP 2',
                    style: CustomTypography.Typography.label(),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: CustomTypography.Typography.description(),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            color: white,
            margin: EdgeInsets.only(bottom: 3),
            padding: EdgeInsets.all(15),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Button(
                    label: Text('DONE'),
                    padding: 40,
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildTTSDialog(context),
                      );
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTTSDialog(BuildContext context) {
  return TTSDialog();
}
