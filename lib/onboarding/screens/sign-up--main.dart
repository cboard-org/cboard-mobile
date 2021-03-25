import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:flutter/material.dart';

class SignUpMain extends StatefulWidget {
  const SignUpMain({Key key}) : super(key: key);
  @override
  _SignUpMainState createState() => _SignUpMainState();
}

class _SignUpMainState extends State<SignUpMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Sign Up'),
        appBar: AppBar(),
      ),
    );
  }
}
