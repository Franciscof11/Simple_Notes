// ignore_for_file: avoid_print, unused_element

import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

enum TtsState {
  playing,
  stopped,
}

class Speech {
  late FlutterTts flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  void textToSpeech(String? text) async {
    double volume = 1;
    double pitch = 1.0;
    double rate = 0.5;
    flutterTts.setLanguage('pt-BR');

    ttsState = TtsState.playing;

    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (text != null) {
      if (text.isNotEmpty) {
        await flutterTts.speak(text);
      }
    }
    final isCompleted = await flutterTts.awaitSpeakCompletion(true);

    if (isCompleted == 1) {
      ttsState = TtsState.stopped;
    }
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) ttsState = TtsState.stopped;
  }
}
