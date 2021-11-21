import 'dart:io';

import 'package:cboard_mobile/providers/settings/settings.dart';
import 'package:cboard_mobile/sharedWidgets/app-bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

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
  FlutterTts tts;
  String engine, language;
  bool isCurrentLanguageInstalled;

  _getDefaultEngine() async {
    engine = await tts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  void initState() {
    super.initState();
    tts = new FlutterTts();
    if (Platform.isAndroid) {
      _getDefaultEngine();
    }
  }

  List<DropdownMenuItem<String>> _getEngineDropDownMenuItems(dynamic engines) {
    var items = <DropdownMenuItem<String>>[];
    for (dynamic type in engines) {
      items.add(DropdownMenuItem(
        value: type as String,
        child: Text(type as String),
      ));
    }
    return items;
  }

  void changedEnginesDropDownItem(String selectedEngine) {
    tts.setEngine(selectedEngine);
    language = null;
    setState(() {
      engine = selectedEngine;
    });
  }

  Widget _engineDropDownHelper(dynamic engines) => Container(
        padding: EdgeInsets.only(top: 50.0),
        child: DropdownButton(
          value: engine,
          items: _getEngineDropDownMenuItems(engines),
          onChanged: changedEnginesDropDownItem,
        ),
      );

  Widget _engineDropDown() {
    if (Platform.isAndroid) {
      return FutureBuilder<dynamic>(
        future: tts.getEngines,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return _engineDropDownHelper(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("Error loading engines");
          } else {
            return Text("Loading engines");
          }
        },
      );
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  void _updateLanguage(String language) {
    tts.setLanguage(language);
    if (Platform.isAndroid) {
      tts
          .isLanguageInstalled(language)
          .then((value) => isCurrentLanguageInstalled = (value as bool));
    }
  }

  @override
  Widget build(BuildContext context) {
    SettingsModel settingsModel = Provider.of<SettingsModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          child: _engineDropDown(),
        ),
        Expanded(
            child: FutureBuilder<dynamic>(
          future: tts.getLanguages,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index] as String),
                      subtitle: Text(snapshot.data[index] as String),
                      onTap: () {
                        setState(() {
                          language = snapshot.data[index] as String;
                          print(language);
                          _updateLanguage(language);
                          settingsModel.updateLocale(language);
                        });
                      },
                      trailing: (language == (snapshot.data[index] as String))
                          ? Icon(Icons.check)
                          : null,
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("Error Loading languages!");
            } else {
              return Text("Loading languages");
            }
          },
        ))
      ],
    );
  }
}
