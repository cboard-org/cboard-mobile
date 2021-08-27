import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/onboarding/widgets/password-confirm-provider.dart';
import 'package:provider/provider.dart';

class NameField extends StatefulWidget {
  final TextEditingController controller;
  const NameField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<PasswordConfirmProvider>(context);

    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Name',
              suffixIcon:
                  RegExp(r"^[A-Za-z]+((\s)?((\'|\-|\.)?([A-Za-z])+))*$").hasMatch(widget.controller.text)
                      ? Icon(
                          Icons.check,
                          color: fruit_salad,
                        )
                      : null),
          onChanged: (text) => appState.setNameText(text),
          validator: (value) {
            if (value.isEmpty)
              return 'Please enter your name';
            else
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