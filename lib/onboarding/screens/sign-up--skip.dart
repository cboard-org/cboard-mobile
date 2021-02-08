import 'package:cboard_mobile/onboarding/widgets/header-user.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
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
        ],
      ),
    );
  }
}
