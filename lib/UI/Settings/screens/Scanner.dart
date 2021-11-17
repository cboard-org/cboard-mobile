import 'package:cboard_mobile/Providers/settings/settings.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/divider.dart';
import 'package:cboard_mobile/sharedWidgets/switchTile.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text("Scanning"),
      ),
      body: Center(
        child: ScannerStateful(),
      ),
    );
  }
}

class ScannerStateful extends StatefulWidget {
  @override
  _ScannerStateful createState() => _ScannerStateful();
}

class _ScannerStateful extends State<ScannerStateful> {
  @override
  Widget build(BuildContext context) {
    var settingmodel = Provider.of<SettingsModel>(context);
    return Container(
      margin: EdgeInsets.only(left: 5, top: 20),
      child: ListView(
        children: [
          ListTile(
              subtitle: Text(
                  "Scanner will iterate over the elements, press any key to select them. Press Escape 4 times to deactivate Scanner.")),
          DividerLine(),
          SwitchTile(
              "Enable",
              "Start scanning boards immediately",
              settingmodel.boardScanned,
              (bool newVal) => settingmodel.updateBoardScanned()),
          DividerLine(),
          ListTile(
            title: Text("Time delay"),
            subtitle: RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text:
                        'This option will export a single board you have from a list of boards. You can choose ',
                    style: new TextStyle(color: dark_gray),
                  ),
                ],
              ),
            ),
            trailing: DropdownButton(
                value: settingmodel.timeDelay,
                elevation: 16,
                style: const TextStyle(
                  color: dark_gray,
                ),
                underline: Container(
                  height: 2,
                  color: dark_gray,
                ),
                onChanged: (var newVal) {
                  settingmodel.updateTimeDelay(newVal);
                },
                items: <double>[0.75, 1, 2, 3, 5]
                    .map<DropdownMenuItem<double>>((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Text(value.toString() + " seconds"),
                  );
                }).toList()),
          ),
          DividerLine(),
          ListTile(
            title: Text("Scan method"),
            subtitle: Text('Method to be used for board exploration'),
            trailing: DropdownButton(
              value: settingmodel.method,
              elevation: 16,
              style: const TextStyle(
                color: dark_gray,
              ),
              underline: Container(
                height: 2,
                color: dark_gray,
              ),
              onChanged: (var newVal) {
                settingmodel.updateMethod(newVal);
              },
              items: [
                DropdownMenuItem<scanningMethod>(
                  value: scanningMethod.Automatic,
                  child: Text('Automatic'),
                ),
                DropdownMenuItem<scanningMethod>(
                  value: scanningMethod.Manual,
                  child: Text('Manual'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
