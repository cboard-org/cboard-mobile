import 'package:cboard_mobile/UI/onboarding/widgets/custom-container.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';

class SignUpComplete extends StatefulWidget {
  final String username;

  const SignUpComplete({Key key, this.username}) : super(key: key);

  @override
  _SignUpCompleteState createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppBar(
        title: Text("Sign Up Complete"),
        appBar: AppBar(),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(85, 45, 85, 80),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: shalimar,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.94,
                          blurRadius: 25)
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/celebrate.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      // width: screenWidth/10,
                      height: screenHeight / 25,
                      alignment: Alignment.center,
                      child: Text(
                        "Celebrate",
                        style: CustomTypography.Typography.subheader(),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          color: white_smoke,
                          borderRadius: BorderRadius.vertical(),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1.94,
                                blurRadius: 25)
                          ]),
                    )
                  ],
                ),
              ),
            ),
            CustomContainer(username: widget.username)
          ],
        ),
      ),
      backgroundColor: cosmic_latte,
    );
  }
}
