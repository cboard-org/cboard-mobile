import 'package:url_launcher/url_launcher.dart';

class Feedback {
  static Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@cboard.io',
      queryParameters: {'subject': r'Cboard feedback'});

  static void launchEmail() {
    try {
      launch(_emailLaunchUri.toString());
      print("Launch 1");
    } catch (Exception) {
      print("Launch 2");
      launch(
          "https://mail.google.com/mail/?view=cm&fs=1&to=support@cborad.io&su=Cboard+feedback");
    }
  }

  static Future<void> sendFeedback() async {}

  Feedback();
}
