import 'dart:convert';

import 'package:cboard_mobile/UI//onboarding/widgets/username-field.dart';
import 'package:cboard_mobile/models/data/data.dart';
import 'package:cboard_mobile/UI/locked/screens/home_screen.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/header.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/password-confirm-provider.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/password-field.dart';
import 'package:cboard_mobile/models/data/jsonString.dart';
import 'package:cboard_mobile/models/error.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// Not really sure how entrypted things should be here!
Future<GetUserResponse> createUserLogin(String email, String password) async {
  final response = await http.post(
    Uri.https('jsonplaceholder.typicode.com', 'users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      // Should necessarily send password here too!
    }),
  );

  // If login was successful, return response body; else, exception - also am not sure if this is right!
  if (response.statusCode == 201)
    // if (response.statusCode == 200) // Note to use 201 for testing with `jsonplaceholder` and replace with 200 for `cboard-api`
    return GetUserResponse.fromJson(jsonDecode(response.body));
  else
    throw Exception(ErrorResponse.fromJson(jsonDecode(response.body)));
}

class GetUserResponse {
  final String name;
  final String email;
  final String locale;

  GetUserResponse({this.name, this.email, this.locale});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      name: json['name'],
      email: json['email'],
      locale: json['locale'],
    );
  }
}

class LogInForm extends StatefulWidget {
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  Future<GetUserResponse> _futureGetUserResponse;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => PasswordConfirmProvider(),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                child: UsernameField(controller: _usernameController),
                margin: EdgeInsets.only(bottom: 30),
              ),
              Container(
                child: PasswordField(controller: _passwordController),
                margin: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: studio),
                      textAlign: TextAlign.right,
                    ),
                    margin: EdgeInsets.only(bottom: 50),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              Expanded(
                child: Row(
                  children: [
                    Button(
                      label: Text('LOG IN'),
                      onPress: () {
                        if (_formKey.currentState.validate()) {
                          // Sends email and password for login
                          // Currently also using an ad-hoc approach to state management when we should probably create a service (https://dev.to/aaronksaunders/simple-login-flow-in-flutter-then-firebase-part-one-29n6)
                          setState(() {
                            _futureGetUserResponse = createUserLogin(
                                _usernameController.text,
                                _passwordController.text);
                          });

                          // If the future response is not empty, parse it and navigate to homescreen
                          // if (_futureGetUserResponse != null) {
                          //   return FutureBuilder<GetUserResponse>(
                          //     future: _futureGetUserResponse,
                          //     builder: (context, snapshot) {
                          //       if (snapshot.hasData)
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(builder: (context) => HomeScreen()),
                          //         );
                          //       else if (snapshot.hasError)
                          //         return Text('${snapshot.error}');
                          //       return CircularProgressIndicator();
                          //     },
                          //   );
                          // }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      data: getData(jsonString).folders,
                                      boardId: "root",
                                    )),
                          );
                        }
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ));
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
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              Expanded(
                child: Container(
                  child: LogInForm(),
                  color: white,
                  margin: EdgeInsets.only(top: 3),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                ),
              ),
            ],
          ),
        )));
  }
}
