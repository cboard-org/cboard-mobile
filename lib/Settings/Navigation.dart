import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Navigation"),
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
        divider(),
        listTile_section(
            'Remove symbols from the output bar', 'subtitle', _remove_symbol),
        divider(),
        listTile_section(
            'Enable quick settings unlock', 'subtitle', _settings_unlock),
        divider(),
        listTile_section(
            'Enable folder vocalization', 'subtitle', _folder_vocalization),
      ],
    );
  }

  Widget divider() {
    return Divider(
      height: 20,
      color: Color(0xffE0E0E0),
      thickness: 1,
    );
  }

  Widget listTile_section(String title, String subtitle, bool state) {
    return SwitchListTile(
      activeColor: Color(0xff5600E8),
      title: Container(
          width: 196,
          child:
              Text(title, style: TextStyle(fontSize: 14, color: Colors.black))),
      subtitle: Text(subtitle,
          style: TextStyle(fontSize: 12, color: Color(0xff7C7C7C))),
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
