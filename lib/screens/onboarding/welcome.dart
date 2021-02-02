import 'package:cboard_mobile/screens/onboarding/sign-up--skip.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/widgets/onboarding/header.dart';
import 'package:cboard_mobile/widgets/shared/app-bar.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('Welcome'),
          appBar: AppBar(),
          widgets: [
            TextButton(
              child: Text('SKIP'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.w400),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpSkip()),
                );
              },
            )
          ],
        ),
        body: Column(children: [
          Column(
            children: [
              Container(
                child: Header(),
                margin: EdgeInsets.only(bottom: 50),
              ),
              Container(
                child: Placeholder(
                  fallbackHeight: 60,
                ),
                margin: EdgeInsets.only(bottom: 20),
              ),
              Container(
                child: Placeholder(
                  fallbackHeight: 60,
                ),
                margin: EdgeInsets.only(bottom: 90),
              ),
            ],
          ),
        ]));
  }
}
