import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/shared/app-bar.dart';

class VoiceRecorder extends StatefulWidget {
  bool tileRecord;

  VoiceRecorder({Key key, this.tileRecord}) : super(key: key);
  @override
  _TileNameState createState() => _TileNameState();
}

class _TileNameState extends State<VoiceRecorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height) / 15,
        child: BaseAppBar(
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: Icon(Icons.arrow_back, color: Colors.white, size: 25.0),
          ),
          title: Text('Voice Recorder'),
        ),
      ),
      body: ListTile(
        // Tile Name
        title: Text('Voice Recorder'),
        subtitle: Text("Have a customized voice recording for this tile"),
        trailing: Wrap(
          children: [
            Switch(
              value: widget.tileRecord,
              onChanged: (value) {
                setState(() {
                  widget.tileRecord = value;
                  // print();
                });
              },
              activeTrackColor: paua,
              activeColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
