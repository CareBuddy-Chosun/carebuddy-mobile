import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/providers/language_provider.dart';
import '../../../../core/services/tts_service.dart';
import '../../../../core/services/voice_flow_controller.dart';
import '../providers/consultation_provider.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/voice_input_button.dart';
import '../widgets/triage_result_banner.dart';
import '../widgets/quick_reply_buttons.dart';
import '../widgets/triage_detail_card.dart';
import '../widgets/emergency_banner.dart';

class ConsultationScreen extends ConsumerStatefulWidget {
  const ConsultationScreen({super.key, this.sessionId});

  final String? sessionId;

  @override
  ConsumerState<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends ConsumerState<ConsultationScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  // Single STT instance for the whole screen so manual + hands-free share it
  // and never run two listen sessions at once.
  final SpeechToText _stt = SpeechToText();
  bool _sttAvailable = false;
  bool _sttInitTried = false;

  /// Hands-free voice mode (FR-006/007/008). Default ON.
  bool _voiceMode = true;

  /// TTS audio playback toggle (kept independent so the user can mute audio
  /// while still using voice mode for listening, or vice-versa).
  bool _ttsEnabled = true;

  /// Single source of truth for the voice loop. idle / ttsPlaying / listening
  /// / processing. The mic must NEVER be active unless we are in `listening`.
  VoiceFlowState _flow = VoiceFlowState.idle;

  /// Live (interim) transcript shown while listening (FR-008).
  String _partialTranscript = '';

  /// Hint shown when STT is unavailable / permission denied.
  String? _sttHint;

  bool get _isSpeaking => _flow == VoiceFlowState.ttsPlaying;
  bool get _isListening => _flow == VoiceFlowState.listening;

  String get _ttsLang => ref.read(languageProvider) == 'en' ? 'en-US' : 'ko-KR';
  String get _sttLocale => ref.read(languageProvider) == 'en' ? 'en_US' : 'ko_KR';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(consultationProvider.notifier).init(widget.sessionId);
    });
    _initStt();
  }

  Future<void> _initStt() async {
    _sttInitTried = true;
    try {
      _sttAvailable = await _stt.initialize(
        onError: (e) {
          // Permanent errors end the session; surface a gentle hint and fall
          // back to manual rather than crashing or looping.
          if (!mounted) return;
          setState(() {
            _sttHint = 'Voice input unavailable. You can type instead.';
            if (_flow == VoiceFlowState.listening) {
              _flow = VoiceFlowState.idle;
            }
          });
        },
        onStatus: (_) {},
      );
    } catch (_) {
      _sttAvailable = false;
    }
    if (!mounted) return;
    setState(() {
      if (!_sttAvailable) {
        _sttHint = 'Microphone/speech not available. You can type instead.';
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    // Tear down audio so nothing keeps playing/listening after we leave.
    _stt.cancel();
    ref.read(ttsServiceProvider).stop();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Voice loop. The golden rule for no audio feedback:
  //   * Before any TTS starts -> stop the mic and await it.
  //   * The mic is only (re)started from the TTS completion callback.
  // ---------------------------------------------------------------------------

  /// Speak [text]. Stops the mic first, then plays TTS. When TTS finishes and
  /// hands-free voice mode is on, auto-starts listening.
  Future<void> _speak(String text) async {
    if (!_ttsEnabled) {
      // Audio muted: skip TTS but still continue the hands-free loop.
      if (_voiceMode) await _startListening();
      return;
    }

    // Guarantee the mic is fully stopped before speaking (no feedback loop).
    await _stopListening();

    if (!mounted) return;
    setState(() => _flow = VoiceFlowState.ttsPlaying);

    try {
      await ref.read(ttsServiceProvider).speak(text, lang: _ttsLang);
    } finally {
      // TTS completion callback path: only here do we (re)enable the mic.
      if (mounted) {
        if (_voiceMode) {
          await _startListening();
        } else {
          setState(() => _flow = VoiceFlowState.idle);
        }
      }
    }
  }

  /// Stop TTS playback and (if applicable) settle state.
  Future<void> _stopSpeaking() async {
    await ref.read(ttsServiceProvider).stop();
    if (mounted && _flow == VoiceFlowState.ttsPlaying) {
      setState(() => _flow = VoiceFlowState.idle);
    }
  }

  /// Start (or restart) listening. Never starts while TTS is playing.
  Future<void> _startListening() async {
    if (!_sttAvailable) {
      if (!_sttInitTried) await _initStt();
      if (!_sttAvailable) {
        if (mounted) setState(() => _flow = VoiceFlowState.idle);
        return;
      }
    }
    // Defensive: never listen during playback.
    if (_flow == VoiceFlowState.ttsPlaying) return;
    if (_stt.isListening) return;

    setState(() {
      _flow = VoiceFlowState.listening;
      _partialTranscript = '';
      _sttHint = null;
    });

    try {
      await _stt.listen(
        onResult: _onSpeechResult,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        localeId: _sttLocale,
        listenOptions: SpeechListenOptions(partialResults: true),
      );
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _flow = VoiceFlowState.idle;
        _sttHint = 'Could not start microphone. You can type instead.';
      });
    }
  }

  /// Stop listening and await it so the recognizer is fully released before we
  /// hand the audio device to TTS.
  Future<void> _stopListening() async {
    if (_stt.isListening) {
      await _stt.stop();
    }
    if (mounted) setState(() => _partialTranscript = '');
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (!mounted) return;
    // FR-008: surface interim results live.
    setState(() => _partialTranscript = result.recognizedWords);

    if (result.finalResult) {
      final text = result.recognizedWords.trim();
      setState(() {
        _partialTranscript = '';
        _flow = VoiceFlowState.processing;
      });
      if (text.isEmpty) {
        // Heard nothing usable: in voice mode, listen again; else go idle.
        if (_voiceMode) {
          _startListening();
        } else {
          setState(() => _flow = VoiceFlowState.idle);
        }
        return;
      }
      // Auto-send the final transcript. The assistant reply -> ttsText change
      // is picked up by the ref.listen below, which speaks it and (in voice
      // mode) re-opens the mic, closing the loop.
      _sendMessage(text, inputType: 'voice');
    }
  }

  Future<void> _sendMessage(String text, {String inputType = 'text'}) async {
    if (text.trim().isEmpty) return;
    _textController.clear();
    // Make sure the mic is off while we process/await a reply.
    await _stopListening();
    if (mounted) setState(() => _flow = VoiceFlowState.processing);
    await ref
        .read(consultationProvider.notifier)
        .sendMessage(text.trim(), inputType: inputType);
    _scrollToBottom();
  }

  /// Manual mic control used when hands-free voice mode is OFF: a simple
  /// tap-to-talk that records once and sends the final transcript.
  Future<void> _toggleManualMic() async {
    if (_isListening) {
      await _stopListening();
      if (mounted) setState(() => _flow = VoiceFlowState.idle);
      return;
    }
    await _stopSpeaking();
    await _startListening();
  }

  void _toggleVoiceMode() {
    final next = !_voiceMode;
    setState(() => _voiceMode = next);
    if (!next) {
      // Turning hands-free OFF: stop any active audio and return to manual.
      _stopSpeaking();
      _stopListening();
      setState(() => _flow = VoiceFlowState.idle);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(consultationProvider);

    ref.listen(consultationProvider, (prev, next) {
      if (next.error != null && next.error != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: Colors.red),
        );
      }

      // Auto-play TTS for greeting (FR-006) and every assistant reply (FR-007).
      // After playback the loop re-opens the mic in voice mode.
      if (_ttsEnabled &&
          next.ttsText != null &&
          next.ttsText != prev?.ttsText) {
        _speak(next.ttsText!);
      } else if (_voiceMode &&
          next.ttsText != null &&
          next.ttsText != prev?.ttsText) {
        // Audio muted but hands-free on: skip speaking, just resume listening.
        _startListening();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation'),
        actions: [
          IconButton(
            icon: Icon(_voiceMode ? Icons.record_voice_over : Icons.voice_over_off),
            tooltip: _voiceMode ? 'Hands-free: On' : 'Hands-free: Off',
            onPressed: _toggleVoiceMode,
          ),
          IconButton(
            icon: Icon(_ttsEnabled ? Icons.volume_up : Icons.volume_off),
            tooltip: _ttsEnabled ? 'TTS On' : 'TTS Off',
            onPressed: () {
              setState(() => _ttsEnabled = !_ttsEnabled);
              if (!_ttsEnabled) _stopSpeaking();
            },
          ),
          if (_isSpeaking)
            IconButton(
              icon: const Icon(Icons.stop_circle),
              tooltip: 'Stop speaking',
              onPressed: _stopSpeaking,
            ),
        ],
        bottom: state.triageResult != null && !state.sessionComplete
            ? PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: TriageResultBanner(result: state.triageResult!.level),
              )
            : null,
      ),
      body: Column(
        children: [
          // Emergency banner
          if (state.isEmergency)
            EmergencyBanner(
              onNotifyGuardians: () =>
                  ref.read(consultationProvider.notifier).notifyGuardians(),
              onFindHospitals: () => context.push('/hospitals', extra: 'EMERGENCY'),
            ),

          // Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: state.messages.length,
              itemBuilder: (context, i) =>
                  ChatBubble(message: state.messages[i]),
            ),
          ),

          // Triage detail card when session is complete
          if (state.sessionComplete && state.triageResult != null)
            TriageDetailCard(
              triageResult: state.triageResult!,
              onNotifyGuardians: state.isEmergency
                  ? () => ref
                      .read(consultationProvider.notifier)
                      .notifyGuardians()
                  : null,
              onFindHospitals: () => context.push('/hospitals',
                  extra: state.triageResult!.level),
            ),

          // Quick reply buttons
          if (state.quickReplyOptions != null &&
              state.quickReplyOptions!.isNotEmpty &&
              !state.sessionComplete)
            QuickReplyButtons(
              options: state.quickReplyOptions!,
              onSelected: (option) =>
                  _sendMessage(option, inputType: 'button'),
              enabled: !state.isLoading,
            ),

          // Loading indicator
          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),

          // Live listening / transcript bar (FR-008)
          if (_isListening && !state.sessionComplete)
            _ListeningBar(transcript: _partialTranscript),

          // STT-unavailable hint
          if (_sttHint != null && !state.sessionComplete)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                _sttHint!,
                style: const TextStyle(color: Colors.orange, fontSize: 12),
              ),
            ),

          // Input bar (hidden when session complete)
          if (!state.sessionComplete)
            _InputBar(
              controller: _textController,
              onSend: _sendMessage,
              isLoading: state.isLoading,
              // In hands-free mode the loop drives the mic, so the manual mic
              // button is hidden; otherwise show tap-to-talk.
              showManualMic: !_voiceMode,
              isListening: _isListening,
              micEnabled: _sttAvailable,
              onToggleMic: _toggleManualMic,
            ),
        ],
      ),
    );
  }
}

/// Live partial-transcript bar shown above the input while the mic is open.
class _ListeningBar extends StatelessWidget {
  const _ListeningBar({required this.transcript});

  final String transcript;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: AppTheme.primary.withValues(alpha: 0.08),
      child: Row(
        children: [
          const Icon(Icons.mic, color: AppTheme.emergency, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              transcript.isEmpty ? 'Listening…' : transcript,
              style: TextStyle(
                fontStyle:
                    transcript.isEmpty ? FontStyle.italic : FontStyle.normal,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  const _InputBar({
    required this.controller,
    required this.onSend,
    required this.isLoading,
    required this.showManualMic,
    required this.isListening,
    required this.micEnabled,
    required this.onToggleMic,
  });

  final TextEditingController controller;
  final Future<void> Function(String) onSend;
  final bool isLoading;
  final bool showManualMic;
  final bool isListening;
  final bool micEnabled;
  final VoidCallback onToggleMic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          if (showManualMic)
            VoiceInputButton(
              isListening: isListening,
              enabled: micEnabled,
              onTap: onToggleMic,
            ),
          if (showManualMic) const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              enabled: !isLoading,
              decoration: InputDecoration(
                hintText: 'Type your symptoms...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              onSubmitted: isLoading ? null : onSend,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: isLoading ? null : () => onSend(controller.text),
            icon: const Icon(Icons.send),
            color: AppTheme.primary,
          ),
        ],
      ),
    );
  }
}
