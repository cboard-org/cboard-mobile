import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
// static const String route = "display";
// final Map<String,String> arguments;
// Display(this.arguments);

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

enum size { Standard, Large, ExtraLarge }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidget createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  bool _darkTheme = false;
  bool _predictiveText = false;
  bool _outputBar = false;
  size _uiSize = size.Standard;
  size _fontSize = size.Standard;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        radioSection('UI Size', 'Elements Size', _uiSize),
        DividerLine(),
        radioSection('Font Size', 'App Font Size', _fontSize),
        DividerLine(),
        listTileSection(
            'Enable Dark Theme',
            'The theme specifies the color of the components, darkness of the surfaces, level of shadow, appropriate opacity of ink elements, etc.',
            _darkTheme),
        DividerLine(),
        listTileSection(
            'Enable Predictive Text',
            'Predictive text will arrange the cards so that recommended cards based on past history will be recommended and shown first',
            _predictiveText),
        DividerLine(),
        listTileSection(
            'Hide the Output Bar',
            'Hides the white bar on the top where you build a sentence',
            _outputBar),
      ],
    );
  }

  Widget listTileSection(String title, String subtitle, bool state) {
    return SwitchListTile(
      activeColor: pure_violet,
      title: Container(
          width: 196,
          child:
              Text(title, style: TextStyle(fontSize: 14, color: Colors.black))),
      subtitle:
          Text(subtitle, style: TextStyle(fontSize: 12, color: dark_gray)),
      value: state,
      onChanged: (bool newValue) {
        setState(() {
          if (title == "Enable Dark Theme") {
            _darkTheme = newValue;
          } else if (title == "Enable Predictive Text")
            _predictiveText = newValue;
          else
            _outputBar = newValue;
        });
      },
    );
  }

  Widget _radio(size groupState, size state, String title) {
    return Radio(
      activeColor: pure_violet,
      value: state,
      groupValue: groupState,
      onChanged: (size newValue) {
        setState(() {
          if (title == 'UI Size')
            _uiSize = newValue;
          else {
            _fontSize = newValue;
          }
        });
      },
    );
  }

  Widget radioSection(String title, String subtitle, size groupState) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 14)),
            Text(subtitle, style: TextStyle(fontSize: 12, color: dark_gray)),
            Row(
              children: [
                Expanded(
                    child: Column(children: [
                  _radio(groupState, size.Standard, title),
                  Text("Standard",
                      style: TextStyle(fontSize: 12, color: dark_gray))
                ])),
                Expanded(
                    child: Column(children: [
                  _radio(groupState, size.Large, title),
                  Text("Large",
                      style: TextStyle(fontSize: 12, color: dark_gray))
                ])),
                Expanded(
                    child: Column(children: [
                  _radio(groupState, size.ExtraLarge, title),
                  Text("Extra large",
                      style: TextStyle(fontSize: 12, color: dark_gray))
                ])),
              ],
            ),
          ],
        ));
  }
}
