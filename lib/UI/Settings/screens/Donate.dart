import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:cboard_mobile/sharedWidgets/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text('Donate'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 21,
          ),
          Text(
            'How would you like to support us ?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 21,
          ),
          Card(
            shadowColor: pig_pink,
            elevation: 3,
            margin: EdgeInsets.only(left: 21, right: 21),
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListTile(
                leading: Image.asset('assets/images/donate.png'),
                title: Text(
                  'Donation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Custom Contribution',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    Text('Make a custom one time or recurring contribution',
                        style: TextStyle(color: dark_gray, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Card(
            shadowColor: pig_pink,
            elevation: 3,
            margin: EdgeInsets.only(left: 21, right: 21),
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListTile(
                leading: Image.asset('assets/images/backer.png'),
                title: Text(
                  'Backer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Starts at \$2 USD/month',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      Text(
                          'Join us for \$2.00 per month and help sustain our activities',
                          style: TextStyle(color: dark_gray, fontSize: 12)),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Card(
            shadowColor: pig_pink,
            elevation: 3,
            margin: EdgeInsets.only(left: 21, right: 21),
            child: Container(
              padding: EdgeInsets.all(20),
              child: ListTile(
                leading: Image.asset('assets/images/sponsor.png'),
                title: Text(
                  'Sponsor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Starts at \$100 USD/month',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    Text(
                        'Join us for \$100.00 per month and help sustain our activities',
                        style: TextStyle(color: dark_gray, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Button(
            label: Text('Donate'),
            onPress: () {
              launch('https://opencollective.com/cboard#backer');
            },
          ),
          SizedBox(
            height: 21,
          ),
          Text(
            'You will be redirected to a secure, third-party site',
            style: TextStyle(
                fontSize: 12, fontStyle: FontStyle.italic, color: dark_gray),
          ),
        ],
      ),
    );
  }
}
