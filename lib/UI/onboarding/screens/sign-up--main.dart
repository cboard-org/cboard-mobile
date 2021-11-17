import 'package:cboard_mobile/UI/onboarding/screens/language-region.dart';
import 'package:cboard_mobile/UI/onboarding/screens/welcome.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/header-user.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/name-field.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/password-confirm-field.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/password-confirm-provider.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/username-field.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpMain extends StatefulWidget {
  const SignUpMain({Key key}) : super(key: key);

  @override
  _SignUpMainState createState() => _SignUpMainState();
}

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //_autoValidate = false;
    return ChangeNotifierProvider(
        create: (BuildContext context) => PasswordConfirmProvider(),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              Container(
                child: NameField(controller: _nameController),
                margin: EdgeInsets.only(bottom: 20),
              ),
              Container(
                child: UsernameField(controller: _usernameController),
                margin: EdgeInsets.only(bottom: 20),
              ),
              Container(
                child: PasswordConfirmField(
                    passwordController: _passwordController,
                    confirmController: _passwordConfirmController),
                margin: EdgeInsets.only(bottom: 20),
              ),
              Expanded(
                child: Container(
                  child: ButtonBar(
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
                        label: Text('SIGN UP'),
                        padding: 40,
                        onPress: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LanguageRegion()),
                            );
                          }
                        },
                      ),
                    ],
                    alignment: MainAxisAlignment.spaceEvenly,
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: 100),
                ),
              ),
            ],
          ),
        ));
  }
}

class _SignUpMainState extends State<SignUpMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('Sign Up'),
          appBar: AppBar(),
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UserHeader(),
                    Expanded(
                      child: Container(
                        child: SignUpForm(),
                        color: white,
                        margin: EdgeInsets.only(top: 3),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                      ),
                    ),
                  ],
                ))));
  }
}
