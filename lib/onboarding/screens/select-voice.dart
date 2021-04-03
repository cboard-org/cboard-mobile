import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:flutter/material.dart';

class SelectVoice extends StatefulWidget {
  const SelectVoice({Key key}) : super(key: key);
  @override
  _SelectVoiceState createState() => _SelectVoiceState();
}

class _SelectVoiceState extends State<SelectVoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Select Voice'),
        appBar: AppBar(),
      ),
    );
  }
}
