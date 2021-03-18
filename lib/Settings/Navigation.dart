import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

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
  bool _context_aware = true;
  bool _remove_symbol = true;
  bool _settings_unlock = false;
  bool _folder_vocalization = true;

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        listTile_section(
            'Enable context aware back button', 'subtitle', _context_aware),
        DividerLine(),
        listTile_section(
            'Remove symbols from the output bar', 'subtitle', _remove_symbol),
        DividerLine(),
        listTile_section(
            'Enable quick settings unlock', 'subtitle', _settings_unlock),
        DividerLine(),
        listTile_section(
            'Enable folder vocalization', 'subtitle', _folder_vocalization),
      ],
    );
  }

  Widget listTile_section(String title, String subtitle, bool state) {
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
          if (title.toLowerCase().contains("context aware"))
            _context_aware = newValue;
          else if (title.toLowerCase().contains("remove symbols"))
            _remove_symbol = newValue;
          else if (title.toLowerCase().contains("settings unlock"))
            _settings_unlock = newValue;
          else
            _folder_vocalization = newValue;
        });
      },
    );
  }
}
