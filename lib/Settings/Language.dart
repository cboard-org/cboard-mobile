import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Language'),
        appBar: AppBar(),
      ),
      body: Center(
        child: LanguageStateful(),
      ),
    );
  }
}

class LanguageStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LanguageStateful();
}

class _LanguageStateful extends State<LanguageStateful> {
  final Map<String, String> languages = {
    'English (en-GB)': 'English',
    '日本語': 'Japanese',
  };
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Color(0xffE0E0E0), indent: 78),
      itemCount: languages.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(languages.keys.elementAt(index)),
          subtitle: Text(languages.values.elementAt(index)),
          onTap: () {},
        );
      },
    );
  }
}
