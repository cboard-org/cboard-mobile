import 'package:cboard_mobile/UI/onboarding/screens/sign-up-complete.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/password-confirm-provider.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/select-female-voice.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/select-funny-voice.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/select-male-voice.dart';
import 'package:cboard_mobile/UI/onboarding/widgets/select-robot-voice.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoicePage extends StatefulWidget {
  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<PasswordConfirmProvider>(context);
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Select Voice'),
        appBar: AppBar(),
      ),
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 50.0),
          Container(
              //padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.68,
                children: [
                  SelectMaleVoice(),
                  SelectFemaleVoice(),
                  SelectRobotVoice(),
                  SelectFunnyVoice(),
                ],
              )),
          SizedBox(height: 5.0),
          Container(
            child: Row(
              children: [
                Button(
                  label: Text('CONFIRM'),
                  padding: 40,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpComplete(
                                  username: loginModel.nameText,
                                )));
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            color: white,
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
