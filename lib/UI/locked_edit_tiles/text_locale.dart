import 'package:cboard_mobile/app_localizations.dart';
import 'package:flutter/material.dart';

class TextLocale extends StatelessWidget {
  final String content;

  const TextLocale({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.of(context).translate(content));
  }
}
