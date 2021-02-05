import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty)
          return '\u26A0 Please enter a valid email';
        else
          return null;
      },
    );
  }
}
