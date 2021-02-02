import 'package:cboard_mobile/screens/onboarding/sign-up--skip.dart';
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
        widgets: <Widget>[
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
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}
