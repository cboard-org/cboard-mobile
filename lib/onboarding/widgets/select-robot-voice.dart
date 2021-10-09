import 'package:flutter/material.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/foundation.dart';
import 'package:cboard_mobile/onboarding/widgets/checkmark.dart';
import 'package:provider/provider.dart';
import 'package:cboard_mobile/models/settings.dart';

class SelectRobotVoice extends StatefulWidget {
  const SelectRobotVoice({Key key}) : super(key: key);
  @override
  _SelectRobotVoiceState createState() => _SelectRobotVoiceState();
}

class _SelectRobotVoiceState extends State<SelectRobotVoice> {
  Widget build(BuildContext context) {
    var settingmodel = Provider.of<SettingsModel>(context);
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              //_toggle();
              settingmodel.updateVoice(voice.Robot);
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFF6B1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              settingmodel.voiceType == voice.Robot
                                  ? Checkmark()
                                  : Icon(null)
                            ])),

                    Container(
                      child: ColorFiltered(
                        colorFilter: settingmodel.voiceType == voice.Robot
                          ? ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop)
                          : ColorFilter.mode(Colors.transparent, BlendMode.saturation),
                          child: Image(
                            image: Image.asset("assets/images/robot.png").image
                          )
                      )
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 25,
                      alignment: Alignment.center,
                      child: Text(
                        "Robot",
                        style: CustomTypography.Typography.subheader(),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1.94,
                                blurRadius: 25)
                          ]),
                    )
                  ],
                ))));
  }
}
