import 'package:cboard_mobile/widgets/onboarding/header.dart';
import 'package:cboard_mobile/widgets/shared/app-bar.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Log In'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Container(
            child: Header(),
            margin: EdgeInsets.only(bottom: 5),
          ),
        ],
      ),
    );
  }
}
