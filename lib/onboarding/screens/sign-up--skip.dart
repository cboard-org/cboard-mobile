import 'package:cboard_mobile/onboarding/screens/sign-up--tts.dart';
import 'package:cboard_mobile/onboarding/screens/welcome.dart';
import 'package:cboard_mobile/onboarding/widgets/header-user.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class SignUpSkip extends StatefulWidget {
  const SignUpSkip({Key key}) : super(key: key);
  @override
  _SignUpSkipState createState() => _SignUpSkipState();
}

class _SignUpSkipState extends State<SignUpSkip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Sign Up'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          UserHeader(shouldSetPhoto: false, locale: 'Croatian'),
          ButtonBar(
            children: [
              Button(
                label: Text('CANCEL'),
                padding: 30,
                isPrimary: false,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
              ),
              Button(
                label: Text('NEXT'),
                isPrimary: false,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpTTS(locale: 'Croatian'),
                    ),
                  );
                },
              ),
            ],
            alignment: MainAxisAlignment.spaceEvenly,
          )
        ],
      ),
    );
  }
}
