import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
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
              return 'Please enter a password';
            else if (value.contains('@')) // Make server call instead?
              return ' Invalid password';
            else
              return null;
          },
        )
      ],
    );
  }
}
