import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

// 웹에서는 Web Speech API를 직접 호출(tts_web.dart), 모바일은 stub.
import 'tts_web_stub.dart' if (dart.library.js_interop) 'tts_web.dart' as webtts;

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
    await _tts.setSpeechRate(1.0);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);

    _initialized = true;
  }

  /// Speak text and call [onComplete] when done.
  ///
  /// If [lang] is provided (e.g. "ko-KR" or "en-US") the TTS language is set
  /// before speaking so playback follows the active app language.
  Future<void> speak(String text, {void Function()? onComplete, String? lang}) async {
    final language = lang ?? 'ko-KR';

    // 웹: flutter_tts_web의 onBoundary 캐스팅 크래시를 피해 Web Speech API 직접 사용.
    if (kIsWeb) {
      try {
        await webtts.webSpeak(text, lang: language, rate: 1.0);
      } catch (_) {
        // TTS는 보조 기능 — 실패해도 대화 흐름을 막지 않는다.
      }
      onComplete?.call();
      return;
    }

    await _ensureInitialized();
    if (lang != null) {
      await _tts.setLanguage(lang);
    }

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
    if (kIsWeb) {
      webtts.webStop();
      return;
    }
    await _tts.stop();
  }

  Future<void> setLanguage(String lang) async {
    if (kIsWeb) return;
    await _ensureInitialized();
    await _tts.setLanguage(lang);
  }

  void dispose() {
    if (kIsWeb) {
      webtts.webStop();
      return;
    }
    _tts.stop();
  }
}
