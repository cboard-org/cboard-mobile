import 'package:cboard_mobile/UI/onboarding/widgets/password-confirm-provider.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsernameField extends StatefulWidget {
  final TextEditingController controller;

  const UsernameField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _UsernameFieldState createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<PasswordConfirmProvider>(context);

    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Email',
              suffixIcon:
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(widget.controller.text)
                      ? Icon(
                          Icons.check,
                          color: fruit_salad,
                        )
                      : null),
          keyboardType: TextInputType.emailAddress,
          onChanged: (text) => appState.setEmailText(text),
          validator: (value) {
            if (value.isEmpty)
              return 'Please enter a valid email';
            else if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value) ==
                false) {
              return 'Please enter a valid email';
            }
            return null;
          },
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
