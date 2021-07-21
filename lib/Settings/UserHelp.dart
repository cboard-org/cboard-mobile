import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

class UserHelp extends StatelessWidget {
  final controller = ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('User help'),
        appBar: AppBar(),
      ),
      body: FutureBuilder(
          future: rootBundle.loadString("assets/markdown/User-help/en-US.md"),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data,
                onTapLink: (text, url, title) {
                  launch(url);
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
