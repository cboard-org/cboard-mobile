import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class Speech extends StatelessWidget {
  String route = "speech";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Speech'),
        appBar: AppBar(),
      ),
      body: Center(
        child: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidget createState() {
    return _MyStatefulWidget();
  }
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  double _currentPitch = 10;
  double _currentRate = 10;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        selectingSection('Dialect', 'newOption'),
        DividerLine(),
        selectingSection('Voice', 'newOption'),
        DividerLine(),
        slidingSection('Pitch', 'Make the voice use a higher or lower pitch',
            _currentPitch),
        DividerLine(),
        slidingSection(
            'Rate', 'Make the voice speaks faster or lower', _currentRate),
      ],
    );
  }

  Widget selectingSection(String section, String newOption) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            newOption,
            style: TextStyle(fontSize: 12, color: dark_gray),
          ),
        ],
      ),
    );
  }

  Widget slidingSection(
      String section, String description, double currentValue) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section,
            style: TextStyle(fontSize: 14),
          ),
          Text(description, style: TextStyle(fontSize: 12, color: dark_gray)),
          Slider(
            activeColor: pure_violet,
            value: currentValue,
            min: 0,
            max: 50,
            label: currentValue.round().toString(),
            onChanged: (double newValue) {
              setState(() {
                if (section == 'Pitch')
                  _currentPitch = newValue;
                else {
                  _currentRate = newValue;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
