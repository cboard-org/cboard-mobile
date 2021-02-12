import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class TTSDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('TTS has not been detected.'),
      content: Column(
        children: [
          Container(
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.'),
            margin: EdgeInsets.only(bottom: 15),
          ),
          Row(
            children: [
              FlatButton(
                child: Text('OK'),
                color: paua,
                textColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
