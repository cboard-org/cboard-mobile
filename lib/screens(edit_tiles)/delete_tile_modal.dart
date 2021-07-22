import 'package:flutter/material.dart';

void deleteTile(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Color(0xFF3A1E72),
    title: Text(
      'Are you sure you want to delete this tile?',
      style: TextStyle(color: Colors.white),
    ),
    content: Text('This action can\'t be undone.',
        style: TextStyle(color: Colors.white)),
    actions: [
      FlatButton(
        textColor: Colors.white,
        onPressed: () {},
        child: Text('YES'),
      ),
      FlatButton(
        textColor: Colors.white,
        onPressed: () {},
        child: Text('NO'),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
