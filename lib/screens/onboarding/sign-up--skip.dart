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
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
    );
  }
}
