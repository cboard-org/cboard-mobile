import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Import extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Import'),
        appBar: AppBar(),
      ),
      body: Center(
        child: ImportStateful(),
      ),
    );
  }
}

class ImportStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImportStateful();
  }
}

class _ImportStateful extends State<ImportStateful> {
  TapGestureRecognizer cBoard, openBoard;
  FilePickerResult result;

  @override
  void initState() {
    super.initState();
    cBoard = new TapGestureRecognizer()
      ..onTap = () {
        launch('https://www.cboard.io/help/#HowdoIimportaboardintoCboard');
      };
    openBoard = new TapGestureRecognizer()
      ..onTap = () {
        launch('https://www.openboardformat.org/');
      };
  }

  @override
  void dispose() {
    cBoard.dispose();
    openBoard.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Import",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text:
                      'This option will import JUST the new boards detected. It WILL NOT import the default boards included on Cboard. Suggested formats are ',
                  style: new TextStyle(color: dark_gray),
                ),
                new TextSpan(
                  text: 'CBoard',
                  style: new TextStyle(color: pure_violet),
                  recognizer: cBoard,
                ),
                new TextSpan(
                  text: ' format or',
                  style: new TextStyle(color: dark_gray),
                ),
                new TextSpan(
                  text: 'OpenBoard',
                  style: new TextStyle(color: pure_violet),
                  recognizer: openBoard,
                ),
                new TextSpan(
                  text: ' format',
                  style: new TextStyle(color: dark_gray),
                ),
              ],
            ),
          ),
          Button(
            label: Text("Import"),
            onPress: () async {
              FilePickerResult _path = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['json'],
              );
              setState(() {
                result = _path;
              });
            },
          ),
          // Text("hello"),
        ],
      ),
    );
  }
}
