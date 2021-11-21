import 'package:cboard_mobile/providers/settings/settings.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/divider.dart';
import 'package:cboard_mobile/sharedWidgets/radioOption.dart';
import 'package:cboard_mobile/sharedWidgets/switchTile.dart';
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
        RadioOption('UI Size', 'Elements Size', settingModel.uiSize,
            (size newSize) => settingModel.updateUiSize(newSize)),
        DividerLine(),
        RadioOption('Font Size', 'App Font Size', settingModel.fontSize,
            (size newSize) => settingModel.updateFontSize(newSize)),
        DividerLine(),
        SwitchTile(
            'Enable Dark Theme',
            'The theme specifies the color of the components, darkness of the surfaces, level of shadow, appropriate opacity of ink elements, etc.',
            settingModel.darkTheme,
            (bool newValue) => settingModel.toggleDarkTheme(newValue)),
        DividerLine(),
        SwitchTile(
            'Enable Predictive Text',
            'Predictive text will arrange the cards so that recommended cards based on past history will be recommended and shown first',
            settingModel.predictiveText,
            (bool newValue) => settingModel.updatePredictiveText(newValue)),
        DividerLine(),
        SwitchTile(
            'Hide the Output Bar',
            'Hides the white bar on the top where you build a sentence',
            settingModel.outputBar,
            (bool newValue) => settingModel.updateOutputBar(newValue)),
      ],
    );
  }
}
