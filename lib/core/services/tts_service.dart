import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../network/voice_repository.dart';

final ttsServiceProvider = Provider<TtsService>((ref) {
  return TtsService(ref.read(voiceRepositoryProvider));
});

class TtsService {
  TtsService(this._voiceRepo);

  final VoiceRepository _voiceRepo;
  final AudioPlayer _player = AudioPlayer();

  /// Synthesize text and play audio. Calls [onComplete] when done.
  Future<void> speak(String text, {VoidCallback? onComplete}) async {
    try {
      final bytes = await _voiceRepo.synthesizeSpeech(text: text);
      await _playBytes(bytes);
      onComplete?.call();
    } catch (_) {
      // If TTS fails, still call onComplete to allow flow to continue
      onComplete?.call();
    }
  }

  Future<void> _playBytes(Uint8List bytes) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/tts_${DateTime.now().millisecondsSinceEpoch}.mp3');
    await file.writeAsBytes(bytes);
    await _player.play(DeviceFileSource(file.path));
    // Wait for playback to complete
    await _player.onPlayerComplete.first;
  }

  Future<void> stop() async {
    await _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}

typedef VoidCallback = void Function();
