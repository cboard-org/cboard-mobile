import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
          child: Column(
            children: [
              Container(
                child: Image(image: AssetImage('assets/images/logo.png')),
                margin: const EdgeInsets.only(bottom: 20),
              ),
              Container(
                child: Text(
                  'C-Board',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Text('Giving every child a voice'),
            ],
          ),
          color: white,
          padding: EdgeInsets.symmetric(vertical: 20)),
    );
  }
}
