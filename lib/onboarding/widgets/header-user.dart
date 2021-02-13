import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';

class UserHeader extends StatefulWidget {
  final bool shouldSetPhoto;
  final String locale;
  const UserHeader({Key key, this.shouldSetPhoto = true, this.locale})
      : super(key: key);

  @override
  _UserHeaderState createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        child: Column(
          children: [
            Image.asset('assets/images/user.png', scale: 0.75),
            widget.shouldSetPhoto
                ? Container(
                    child: Text(
                      'Set Photo',
                      style: TextStyle(color: electric_violet),
                    ),
                    margin: EdgeInsets.only(top: 5),
                  )
                : Container(
                    child: Text(
                      'Please follow these steps to download the ' +
                          widget.locale +
                          ' TTS:',
                      style: CustomTypography.Typography.subheader(),
                      textAlign: TextAlign.center,
                    ),
                    margin: EdgeInsets.only(top: 20),
                  )
          ],
        ),
        color: white,
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      ),
    );
  }
}
