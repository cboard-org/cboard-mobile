import 'package:flutter/material.dart';

class InputFieldStateful extends StatefulWidget {
  @override
  _InputFieldStatefulState createState() => _InputFieldStatefulState();
}

class _InputFieldStatefulState extends State<InputFieldStateful> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                onPressed: () {
                  _toggle();
                }),
          ),
          obscureText: _obscureText,
          enableSuggestions: false,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty)
              return '\u26A0 Please enter a password';
            else if (value.contains('@')) // Make server call instead?
              return '\u26A0 Invalid password';
            else
              return null;
          },
        )
      ],
    );
  }
}
