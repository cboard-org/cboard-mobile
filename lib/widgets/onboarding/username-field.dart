import 'package:flutter/material.dart';

class UsernameField extends StatefulWidget {
  @override
  _UsernameFieldState createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Email',
          suffixIcon:
              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_usernameController.text)
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : null),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty)
          return 'Please enter a valid email';
        else
          return null;
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
}
