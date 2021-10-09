import 'package:cboard_mobile/models/locale.dart';
import 'package:cboard_mobile/models/settings.dart';
import 'package:cboard_mobile/onboarding/screens/sign-up--tts.dart';
import 'package:cboard_mobile/onboarding/screens/welcome.dart';
import 'package:cboard_mobile/onboarding/screens/voice.dart';

import 'package:cboard_mobile/onboarding/widgets/header-user.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageRegion extends StatefulWidget {
  const LanguageRegion({Key key}) : super(key: key);
  @override
  _LanguageRegionState createState() => _LanguageRegionState();
}

class _LanguageRegionState extends State<LanguageRegion> {
  String localeValueLanguage;
  String localeValueCountry;

  @override
  Widget build(BuildContext context) {
    final List<String> localesLanguages = LocaleModel.languageMap.keys.toList();
    final List<String> localesCountries = LocaleModel.countryList.toList();

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Sign Up'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          UserHeader(),
          Container(
              child: DropdownButtonFormField(
                icon: localeValueLanguage == null
                    ? Icon(Icons.arrow_drop_down, color: electric_violet)
                    : Icon(
                        Icons.check,
                        color: fruit_salad,
                      ),
                decoration: InputDecoration(
                    hintText: 'Select Language',
                    hintStyle: TextStyle(color: electric_violet)),
                isExpanded: true,
                style: TextStyle(color: electric_violet),
                onChanged: (String newValue) {
                  setState(() {
                    localeValueLanguage = newValue;
                  });
                },
                items: localesLanguages
                    .map(
                      (String value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 30)),


          Container(
              child: DropdownButtonFormField(
                icon: localeValueCountry == null
                    ? Icon(Icons.arrow_drop_down, color: electric_violet)
                    : Icon(
                        Icons.check,
                        color: fruit_salad,
                      ),
                decoration: InputDecoration(
                    hintText: 'Select Country',
                    hintStyle: TextStyle(color: electric_violet)),
                isExpanded: true,
                style: TextStyle(color: electric_violet),
                onChanged: (String newValue) {
                  setState(() {
                    localeValueCountry = newValue;
                  });
                },
                items: localesCountries
                    .map(
                      (String value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 30)),

              
          if (localeValueCountry != null)
            Container(
              child: Row(
                children: [
                  Container(
                    child: Icon(Icons.error_outline, color: tulip_tree),
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Expanded(
                    child: Text(
                      'Text-to-speech download instructions are available on the next screen',
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 25, bottom: 50),
              padding: EdgeInsets.symmetric(horizontal: 30),
            ),
          Expanded(
            child: Container(
              child: ButtonBar(
                children: [
                  Button(
                    label: Text('CANCEL'),
                    padding: 30,
                    isPrimary: false,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Welcome()),
                      );
                    },
                  ),
                  Button(
                    label: Text('NEXT'),
                    padding: 40,
                    onPress: () {
                      Provider.of<SettingsModel>(context, listen: false)
                          .updateLocale(localeValueLanguage);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VoicePage(),
                        ),
                      );
                    },
                  ),
                ],
                alignment: MainAxisAlignment.spaceEvenly,
              ),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 50),
            ),
          ),
        ],
      ),
      backgroundColor: white,
    );
  }
}
