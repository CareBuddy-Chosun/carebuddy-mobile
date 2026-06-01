import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Web TTS via the browser Web Speech API.
///
/// We bypass flutter_tts on web because flutter_tts_web (4.2.5) registers an
/// `onBoundary` handler that casts JS values (`event['charIndex'] as int`),
/// which throws an uncaught TypeError under the Flutter 3.41 web engine and
/// crashes the consultation flow. Here we only attach `onend`/`onerror`.
Future<void> webSpeak(
  String text, {
  required String lang,
  double rate = 1.0,
}) async {
  final synth = web.window.speechSynthesis;
  // Cancel anything in flight so we never overlap utterances.
  synth.cancel();

  // Voices load asynchronously: getVoices() is often empty on first use, which
  // would leave the utterance on the system default voice (e.g. a Korean voice
  // reading English text with a Korean accent). Wait for the list first.
  final voices = await _loadVoices(synth);

  final utterance = web.SpeechSynthesisUtterance(text)
    ..lang = lang
    ..rate = rate
    ..volume = 1.0
    ..pitch = 1.0;

  final voice = _pickVoice(voices, lang);
  if (voice != null) utterance.voice = voice;

  final completer = Completer<void>();
  void finish() {
    if (!completer.isCompleted) completer.complete();
  }

  utterance.onend = ((web.Event _) => finish()).toJS;
  utterance.onerror = ((web.Event _) => finish()).toJS;

  synth.speak(utterance);
  return completer.future;
}

void webStop() {
  web.window.speechSynthesis.cancel();
}

/// Return the available voices, waiting for the async `voiceschanged` event if
/// the list isn't populated yet (with a short timeout fallback).
Future<List<web.SpeechSynthesisVoice>> _loadVoices(web.SpeechSynthesis synth) {
  final immediate = synth.getVoices().toDart;
  if (immediate.isNotEmpty) return Future.value(immediate);

  final completer = Completer<List<web.SpeechSynthesisVoice>>();
  void done() {
    if (!completer.isCompleted) completer.complete(synth.getVoices().toDart);
  }

  synth.onvoiceschanged = ((web.Event _) => done()).toJS;
  // Don't block forever if the event never fires.
  Future.delayed(const Duration(milliseconds: 700), done);
  return completer.future;
}

/// Choose the most natural-sounding voice that matches [lang].
///
/// Strictly matches the language prefix (e.g. "en") so English text never gets
/// a Korean voice, then prefers cloud/neural voices ("Google", "Natural",
/// "Neural", "Microsoft"). Returns null only when no matching voice exists.
web.SpeechSynthesisVoice? _pickVoice(
  List<web.SpeechSynthesisVoice> voices,
  String lang,
) {
  if (voices.isEmpty) return null;

  final prefix = lang.split('-').first.toLowerCase();
  final matching =
      voices.where((v) => v.lang.toLowerCase().startsWith(prefix)).toList();
  if (matching.isEmpty) return null;

  const preferred = ['google', 'natural', 'neural', 'microsoft'];
  for (final marker in preferred) {
    for (final v in matching) {
      if (v.name.toLowerCase().contains(marker)) return v;
    }
  }
  return matching.first;
}
