import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeakTileButton extends StatefulWidget {
  final text;

  const SpeakTileButton({Key key, this.text}) : super(key: key);

  @override
  _SpeakTileButtonState createState() => _SpeakTileButtonState();
}

class _SpeakTileButtonState extends State<SpeakTileButton> {
  FlutterTts tts = FlutterTts();

  Future _speak(String text) async {
    await tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _speak(widget.text);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        // width: MediaQuery.of(context).size.width/10,
        // height: MediaQuery.of(context).size.height/50,
        //  color: Colors.orange,
        decoration: BoxDecoration(
            color: tangerine,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Icon(
          Icons.volume_up,
          color: white,
          size: 30.0,
        ),
      ),
    );
  }
}
