// ignore_for_file: avoid_print, unused_element

import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

void textToSpeech(String? text) async {
  late FlutterTts flutterTts;
  double volume = 1;
  double pitch = 1.0;
  double rate = 0.5;
  flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  final lang = await flutterTts.getLanguages.then((value) {
    return value[36];
  });

  flutterTts.setLanguage(lang);

  Future speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (text != null) {
      if (text.isNotEmpty) {
        await flutterTts.speak(text);
      }
    }
  }

  speak();
  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) ttsState = TtsState.stopped;
  }
}
