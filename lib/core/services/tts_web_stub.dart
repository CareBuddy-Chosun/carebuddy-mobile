/// Non-web stub. Mobile uses flutter_tts directly, so these are never called
/// (TtsService guards web-only paths behind kIsWeb).
Future<void> webSpeak(
  String text, {
  required String lang,
  double rate = 1.0,
}) async {}

void webStop() {}
