
import 'package:flutter_tts/flutter_tts.dart';

class TTS_Func{

  static FlutterTts flutterTts = FlutterTts();

  static Future speak(String text) async {
    await flutterTts.speak(text);
  }
}