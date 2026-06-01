import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

final ttsServiceProvider = Provider<TtsService>((ref) {
  final service = TtsService();
  ref.onDispose(() => service.dispose());
  return service;
});

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;

    await _tts.setLanguage('ko-KR');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);

    _initialized = true;
  }

  /// Speak text and call [onComplete] when done.
  Future<void> speak(String text, {void Function()? onComplete}) async {
    await _ensureInitialized();

    final completer = Completer<void>();

    _tts.setCompletionHandler(() {
      if (!completer.isCompleted) completer.complete();
    });

    _tts.setErrorHandler((msg) {
      if (!completer.isCompleted) completer.complete();
    });

    _tts.setCancelHandler(() {
      if (!completer.isCompleted) completer.complete();
    });

    await _tts.speak(text);
    await completer.future;
    onComplete?.call();
  }

  Future<void> stop() async {
    await _tts.stop();
  }

  Future<void> setLanguage(String lang) async {
    await _ensureInitialized();
    await _tts.setLanguage(lang);
  }

  void dispose() {
    _tts.stop();
  }
}
