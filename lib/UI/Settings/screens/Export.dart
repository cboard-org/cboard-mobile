import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/divider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  var exportSingle;
  var exportAll;
  var board;

  List<DropdownMenuItem<dynamic>> items = [
    DropdownMenuItem<String>(
      child: Text("CBoard"),
      value: 'cboard',
    ),
    DropdownMenuItem<String>(
      child: Text("OpenBoard"),
      value: 'openBoard',
    ),
    DropdownMenuItem<String>(
      child: Text('PDF'),
      value: 'pdf',
    ),
  ];

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
      child: ListView(
        children: <Widget>[
          ChoiceListTile(
            title: Text("Export a single board"),
            subtitle: RichText(
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
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DropdownButton(
                  hint: Text("Boards"),
                  items: items,
                  value: board,
                  onChanged: (var newOpt) {
                    setState(() {
                      board = newOpt;
                    });
                  },
                ),
                DropdownButton(
                  hint: Text("Export"),
                  value: exportSingle,
                  elevation: 16,
                  style: const TextStyle(
                    color: dark_gray,
                  ),
                  underline: Container(
                    height: 2,
                    color: dark_gray,
                  ),
                  onChanged: (var newOpt) {
                    setState(() {
                      exportSingle = newOpt;
                    });
                  },
                  items: items,
                ),
              ],
            ),
          ),
          DividerLine(),
          ChoiceListTile(
            title: Text("Export all boards"),
            subtitle: RichText(
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
            trailing: DropdownButton(
                hint: Text("Export"),
                value: exportAll,
                elevation: 16,
                style: const TextStyle(
                  color: dark_gray,
                ),
                underline: Container(
                  height: 2,
                  color: dark_gray,
                ),
                onChanged: (var newOpt) {
                  setState(() {
                    exportAll = newOpt;
                  });
                },
                items: items),
          ),
        ],
      ),
    );
  }
}

class ChoiceListTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget leading;
  final Widget trailing;

  const ChoiceListTile(
      {Key key, this.title, this.subtitle, this.leading, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Align(
                child: title,
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: subtitle,
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
        Spacer(
          flex: 1,
        ),
        trailing
      ],
    );
  }
}
