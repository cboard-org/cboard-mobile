import 'package:cboard_mobile/Settings/About.dart';
import 'package:cboard_mobile/Settings/Donate.dart';
import 'package:cboard_mobile/Settings/Export.dart';
import 'package:cboard_mobile/Settings/Import.dart';
// import 'package:cboard_mobile/Settings/Feedback.dart';
import 'package:cboard_mobile/Settings/Navigation.dart';
import 'package:cboard_mobile/Settings/Speech.dart';
import 'package:cboard_mobile/Settings/UserHelp.dart';

import '../onboarding/screens/welcome.dart';
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
  };
}
