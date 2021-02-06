import 'package:cboard_mobile/screens/home_screen.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/widgets/onboarding/header.dart';
import 'package:cboard_mobile/widgets/onboarding/username-field.dart';
import 'package:cboard_mobile/widgets/onboarding/password-field.dart';
import 'package:cboard_mobile/widgets/shared/app-bar.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            child: UsernameField(),
            margin: EdgeInsets.only(bottom: 30),
          ),
          Container(
            child: PasswordField(),
            margin: EdgeInsets.only(bottom: 10),
          ),
          Row(children: <Widget>[
            Container(
              child: Text(
                'Forgot password?',
                style: TextStyle(color: studio),
                textAlign: TextAlign.right,
              ),
              margin: EdgeInsets.only(bottom: 50),
            ),
          ], mainAxisAlignment: MainAxisAlignment.end),
          FlatButton(
            child: Text('LOG IN'),
            color: paua,
            textColor: white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class LogIn extends StatelessWidget {
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
          Container(
            child: Column(
              children: [
                LogInForm(),
              ],
            ),
            color: white,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          ),
        ],
      ),
    );
  }
}
