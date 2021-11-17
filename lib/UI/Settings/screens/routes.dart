import 'package:cboard_mobile/UI/Settings/screens/About.dart';
import 'package:cboard_mobile/UI/Settings/screens/Donate.dart';
import 'package:cboard_mobile/UI/Settings/screens/Export.dart';
import 'package:cboard_mobile/UI/Settings/screens/Import.dart';
import 'package:cboard_mobile/UI/Settings/screens/Language.dart';
// import 'package:cboard_mobile/Settings/Feedback.dart';
import 'package:cboard_mobile/UI/Settings/screens/Navigation.dart';
import 'package:cboard_mobile/UI/Settings/screens/Speech.dart';
import 'package:cboard_mobile/UI/Settings/screens/UserHelp.dart';
import 'package:cboard_mobile/UI/onboarding/screens/welcome.dart';

import 'Display.dart';
import 'Scanner.dart';

getRoute() {
  return {
    '/display': (context) => Display(),
    '/speech': (context) => Speech(),
    '/navigation': (context) => Navigation(),
    '/user help': (context) => UserHelp(),
    '/about': (context) => About(),
    '/welcome': (context) => Welcome(),
    '/export': (context) => Export(),
    '/scanner': (context) => Scanner(),
    '/donate': (context) => Donate(),
    '/import': (context) => Import(),
    '/language': (context) => Language(),
  };
}
