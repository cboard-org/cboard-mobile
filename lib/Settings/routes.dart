import 'package:cboard_mobile/Settings/About.dart';
import 'package:cboard_mobile/Settings/Donate.dart';
import 'package:cboard_mobile/Settings/Export.dart';
// import 'package:cboard_mobile/Settings/Feedback.dart';
import 'package:cboard_mobile/Settings/Navigation.dart';
import 'package:cboard_mobile/Settings/Speech.dart';
import 'package:cboard_mobile/Settings/User_help.dart';

import '../onboarding/screens/welcome.dart';
import 'Display.dart';
import 'Scanner.dart';

getRoute() {
  return {
    '/display': (context) => Display(),
    '/speech': (context) => Speech(),
    '/navigation': (context) => Navigation(),
    '/user help': (context) => User_help(),
    '/about': (context) => About(),
    '/welcome': (context) => Welcome(),
    '/export': (context) => Export(),
    '/scanner': (context) => Scanner(),
    '/donate': (context) => Donate(),
  };
}
