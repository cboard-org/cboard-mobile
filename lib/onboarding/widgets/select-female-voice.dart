import 'package:flutter/material.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/foundation.dart';
import 'package:cboard_mobile/onboarding/widgets/checkmark.dart';

class SelectFemaleVoice extends StatefulWidget {
  const SelectFemaleVoice({Key key}) : super(key: key);
  @override
  _SelectFemaleVoiceState createState() => _SelectFemaleVoiceState();
}

class _SelectFemaleVoiceState extends State<SelectFemaleVoice> {
  bool _selectedVoice = false;
  void _toggle() {
    setState(() {
      _selectedVoice = !_selectedVoice;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              _toggle();
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
                              _selectedVoice
                                  ? Checkmark()
                                  : Icon(null)
                            ])),

                    Container(
                      child: ColorFiltered(
                        colorFilter: _selectedVoice 
                          ? ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop)
                          : ColorFilter.mode(Colors.transparent, BlendMode.saturation),
                          child: Image(
                            image: Image.asset("assets/images/test.png").image
                          )
                      )
                    ),

                    SizedBox(height: 23),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 25,
                      alignment: Alignment.center,
                      child: Text(
                        "Female",
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
