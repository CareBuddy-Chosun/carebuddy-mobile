import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tts_service.dart';

enum VoiceFlowState { idle, ttsPlaying, listening, processing }

final voiceFlowControllerProvider =
    StateNotifierProvider.autoDispose<VoiceFlowController, VoiceFlowState>(
        (ref) {
  return VoiceFlowController(ref.read(ttsServiceProvider));
});

class VoiceFlowController extends StateNotifier<VoiceFlowState> {
  VoiceFlowController(this._ttsService) : super(VoiceFlowState.idle);

  final TtsService _ttsService;

  /// Callback invoked when TTS finishes and the mic should auto-activate.
  void Function()? onTtsComplete;

  /// Play a TTS greeting when consultation starts.
  Future<void> playGreeting(String greetingText) async {
    state = VoiceFlowState.ttsPlaying;
    await _ttsService.speak(greetingText, onComplete: () {
      state = VoiceFlowState.listening;
      onTtsComplete?.call();
    });
  }

  /// Play a TTS response, then switch to listening mode.
  Future<void> playResponse(String ttsText) async {
    state = VoiceFlowState.ttsPlaying;
    await _ttsService.speak(ttsText, onComplete: () {
      state = VoiceFlowState.listening;
      onTtsComplete?.call();
    });
  }

  void setProcessing() => state = VoiceFlowState.processing;
  void setIdle() => state = VoiceFlowState.idle;

  Future<void> stop() async {
    await _ttsService.stop();
    state = VoiceFlowState.idle;
  }

  @override
  void dispose() {
    _ttsService.stop();
    super.dispose();
  }
}
