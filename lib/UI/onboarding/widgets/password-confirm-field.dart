import 'package:cboard_mobile/UI/onboarding/widgets/password-confirm-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordConfirmField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmController;

  const PasswordConfirmField({
    Key key,
    this.passwordController,
    this.confirmController,
  }) : super(key: key);

  @override
  _PasswordConfirmFieldState createState() => _PasswordConfirmFieldState();
}

class _PasswordConfirmFieldState extends State<PasswordConfirmField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<PasswordConfirmProvider>(context);

    return Material(
        child: new Column(
      children: [
        TextFormField(
          controller: widget.passwordController,
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
              },
            ),
          ),
          obscureText: _obscureText,
          enableSuggestions: false,
          autocorrect: false,
          onChanged: (text) => appState.setPasswordText(text),
          validator: (value) {
            if (value.isEmpty)
              return 'Please enter a password';
            else if (value.contains('@')) // Make server call instead?
              return 'Invalid password';
            return null;
          },
        ),
        SizedBox(height: 30),
        TextFormField(
          controller: widget.confirmController,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            hintText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
              onPressed: () {
                _toggle();
              },
            ),
          ),
          obscureText: _obscureText,
          enableSuggestions: false,
          autocorrect: false,
          onChanged: (text) => appState.setPasswordConfirmText(text),
          validator: (value) {
            if (value.isEmpty)
              return 'Please enter a password';
            else if (value.contains('@')) // Make server call instead?
              return 'Invalid password';
            else if (value != widget.passwordController.text) {
              return 'Passwords do not match!';
            }
            return null;
          },
        )
      ],
    ));
  }
}
