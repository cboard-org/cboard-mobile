import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/shared/dropDownSection.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Export extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Export'),
        appBar: AppBar(),
      ),
      body: Center(
        child: ExportStateful(),
      ),
    );
  }
}

class ExportStateful extends StatefulWidget {
  @override
  _ExportStateful createState() {
    return _ExportStateful();
  }
}

class _ExportStateful extends State<ExportStateful> {
  TapGestureRecognizer cBoard, openBoard;

  List items = <String>['CBoard', 'OpenBoard', 'PDF']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

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
    var settingmodel = Provider.of<SettingsModel>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          DropDownSection(
            title: "Export a single board",
            subTitle: RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text:
                        'This option will export a single board you have from a list of boards. You can choose ',
                    style: new TextStyle(color: dark_gray),
                  ),
                  new TextSpan(
                    text: 'CBoard, ',
                    style: new TextStyle(color: pure_violet),
                    recognizer: cBoard,
                  ),
                  new TextSpan(
                    text: 'OpenBoard',
                    style: new TextStyle(color: pure_violet),
                    recognizer: openBoard,
                  ),
                  new TextSpan(
                    text: ' or PDF formats.',
                    style: new TextStyle(color: dark_gray),
                  ),
                ],
              ),
            ),
            initialVal: settingmodel.exportFile,
            items: items,
            onChange: (var newType) => settingmodel.updateExportFile(newType),
          ),
          DividerLine(),
          DropDownSection(
            title: "Export all boards",
            subTitle: RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text:
                        'This option will export ALL the boards you have if you choose ',
                    style: new TextStyle(color: dark_gray),
                  ),
                  new TextSpan(
                    text: 'CBoard',
                    style: new TextStyle(color: pure_violet),
                    recognizer: cBoard,
                  ),
                  new TextSpan(
                    text: ' format or ',
                    style: new TextStyle(color: dark_gray),
                  ),
                  new TextSpan(
                    text: 'OpenBoard',
                    style: new TextStyle(color: pure_violet),
                    recognizer: openBoard,
                  ),
                  new TextSpan(
                    text:
                        ' format. It will export JUST the current board if you choose PDF format.',
                    style: new TextStyle(color: dark_gray),
                  ),
                ],
              ),
            ),
            initialVal: settingmodel.exportFile,
            items: items,
            onChange: (var newType) => settingmodel.updateExportFile(newType),
          ),
        ],
      ),
    );
  }
}
