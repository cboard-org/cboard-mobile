import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped }

class Tts extends StatefulWidget {
  final String inputText;
  final String locale;
  final double volume;
  final double pitch;
  final double rate;

  const Tts(
      {Key key,
      this.inputText,
      this.locale,
      this.volume = 0.5,
      this.pitch = 1.0,
      this.rate = 0.5})
      : super(key: key);

  @override
  _TtsState createState() => _TtsState();
}

class _TtsState extends State<Tts> {
  FlutterTts flutterTts;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setLanguage(widget.locale);

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak() async {
    await flutterTts.setVolume(widget.volume);
    await flutterTts.setSpeechRate(widget.rate);
    await flutterTts.setPitch(widget.pitch);

    if (widget.inputText != null) {
      if (widget.inputText.isNotEmpty) {
        var result = await flutterTts.speak(widget.inputText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(bottomNavigationBar: bottomBar()));
  }
}
