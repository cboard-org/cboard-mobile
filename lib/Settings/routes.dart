import 'package:cboard_mobile/Settings/About.dart';
import 'package:cboard_mobile/Settings/Feedback.dart';
import 'package:cboard_mobile/Settings/Navigation.dart';
import 'package:cboard_mobile/Settings/Speech.dart';
import 'package:cboard_mobile/Settings/User_help.dart';

import 'Display.dart';

getRoute() {
  return {
    '/display': (context) => Display(),
    '/speech': (context) => Speech(),
    '/navigation': (context) => Navigation(),
    '/user help': (context) => User_help(),
    '/about': (context) => About(),
  };
}
