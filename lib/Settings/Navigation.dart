import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/shared/listTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navigation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('Navigation'),
          appBar: AppBar(),
        ),
        body: Center(
          child: MyStatefulWidget(),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  _MyStatefulWidget createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  Widget build(BuildContext context) {
    var settingmodel = Provider.of<SettingsModel>(context);
    return ListView(
      children: <Widget>[
        ListTileSection(
            'Enable context aware back button',
            'Shows big back buttons on top of the boards',
            settingmodel.backButton,
            (bool newVal) => settingmodel.updateBackButton()),
        DividerLine(),
        ListTileSection(
            'Remove symbols from the output bar',
            "Shows 'x' button on each symbol in order to remove it",
            settingmodel.symbolRemovable,
            (bool newVal) => settingmodel.updateSymbolRemove()),
        DividerLine(),
        ListTileSection(
            'Enable quick settings unlock',
            'Unlocks settings with a single click',
            settingmodel.quickSettingUnlock,
            (bool newVal) => settingmodel.updateQuickSetting()),
        DividerLine(),
        ListTileSection(
            'Enable folder vocalization',
            "Reads folder's name out loud when folder is clicked",
            settingmodel.folderVocal,
            (bool newVal) => settingmodel.updateFolderUnlock()),
      ],
    );
  }
}
