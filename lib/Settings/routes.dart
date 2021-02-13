import 'package:cboard_mobile/Settings/Speech.dart';

import 'Display.dart';

getRoute() {
  return {
    '/display': (context) => Display(),
    '/speech': (context) => Speech(),
  };
}
