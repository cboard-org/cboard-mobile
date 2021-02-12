import 'package:cboard_mobile/onboarding/screens/select-voice.dart';
import 'package:cboard_mobile/onboarding/widgets/header-user.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';

class SignUpTTS extends StatefulWidget {
  final String locale;
  const SignUpTTS({Key key, this.locale}) : super(key: key);
  @override
  _SignUpTTSState createState() => _SignUpTTSState();
}

class _SignUpTTSState extends State<SignUpTTS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Install TTS'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Container(
              child: UserHeader(shouldSetPhoto: false, locale: widget.locale),
              margin: EdgeInsets.only(bottom: 3)),
          Container(
              child: Column(
                children: [
                  Container(
                      child: Text(
                        'STEP 1',
                        style: CustomTypography.Typography.label(),
                      ),
                      margin: EdgeInsets.only(bottom: 10)),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: CustomTypography.Typography.description(),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              color: white,
              margin: EdgeInsets.only(bottom: 3),
              padding: EdgeInsets.all(15)),
          Container(
              child: Column(
                children: [
                  Container(
                      child: Text(
                        'STEP 2',
                        style: CustomTypography.Typography.label(),
                      ),
                      margin: EdgeInsets.only(bottom: 10)),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: CustomTypography.Typography.description(),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              color: white,
              margin: EdgeInsets.only(bottom: 3),
              padding: EdgeInsets.all(15)),
          Container(
            child: FlatButton(
                child: Text('DONE'),
                color: paua,
                textColor: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectVoice()),
                  );
                }),
            color: white,
            padding: EdgeInsets.fromLTRB(145, 50, 145, 255),
          ),
        ],
      ),
    );
  }
}
