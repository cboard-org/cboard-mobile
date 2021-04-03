import 'package:cboard_mobile/shared/button.dart';
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
              Button(
                label: Text('OK'),
                padding: 50,
                onPress: () {
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
