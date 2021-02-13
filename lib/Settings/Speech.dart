import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Speech extends StatelessWidget {
  String route = "speech";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech'),
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
        divider(),
        selectingSection('Voice', 'newOption'),
        divider(),
        slidingSection('Pitch', 'Make the voice use a higher or lower pitch',
            _currentPitch),
        divider(),
        slidingSection(
            'Rate', 'Make the voice speaks faster or lower', _currentRate),
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
            style: TextStyle(fontSize: 12, color: Color(0xff7C7C7C)),
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
          Text(description,
              style: TextStyle(fontSize: 12, color: Color(0xff7C7C7C))),
          Slider(
            activeColor: Color(0xff5600E8),
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
