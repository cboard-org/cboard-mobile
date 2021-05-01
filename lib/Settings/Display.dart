import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/shared/listTile.dart';
import 'package:cboard_mobile/shared/radioSection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// static const String route = "display";
// final Map<String,String> arguments;
// Display(this.arguments);
//
// enum size { Standard, Large, ExtraLarge }//*** */
class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('Display'),
          appBar: AppBar(),
        ),
        body: Center(
          child: MyStatefulWidget(),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidget createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    var settingModel = Provider.of<SettingsModel>(context);
    return ListView(
      children: <Widget>[
        RadioSection('UI Size', 'Elements Size', settingModel.uiSize,
            (size newSize) => settingModel.updateUiSize(newSize)),
        DividerLine(),
        RadioSection('Font Size', 'App Font Size', settingModel.fontSize,
            (size newSize) => settingModel.updateFontSize(newSize)),
        DividerLine(),
        ListTileSection(
            'Enable Dark Theme',
            'The theme specifies the color of the components, darkness of the surfaces, level of shadow, appropriate opacity of ink elements, etc.',
            settingModel.darkTheme,
            (bool newValue) => settingModel.updateDarkTheme(newValue)),
        DividerLine(),
        ListTileSection(
            'Enable Predictive Text',
            'Predictive text will arrange the cards so that recommended cards based on past history will be recommended and shown first',
            settingModel.predictiveText,
            (bool newValue) => settingModel.updatePredictiveText(newValue)),
        DividerLine(),
        ListTileSection(
            'Hide the Output Bar',
            'Hides the white bar on the top where you build a sentence',
            settingModel.outputBar,
            (bool newValue) => settingModel.updateOutputBar(newValue)),
      ],
    );
  }
}
