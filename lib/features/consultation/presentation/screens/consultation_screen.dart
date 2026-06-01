import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/services/tts_service.dart';
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
  bool _ttsEnabled = true;
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(consultationProvider.notifier).init(widget.sessionId);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
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

  Future<void> _sendMessage(String text, {String inputType = 'text'}) async {
    if (text.trim().isEmpty) return;
    _textController.clear();
    await ref
        .read(consultationProvider.notifier)
        .sendMessage(text.trim(), inputType: inputType);
    _scrollToBottom();
  }

  Future<void> _speakResponse(String text) async {
    setState(() => _isSpeaking = true);
    try {
      await ref.read(ttsServiceProvider).speak(text);
    } finally {
      if (mounted) setState(() => _isSpeaking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(consultationProvider);

    // Show error as snackbar
    ref.listen(consultationProvider, (prev, next) {
      if (next.error != null && next.error != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: Colors.red),
        );
      }

      // Auto-play TTS when AI responds
      if (_ttsEnabled &&
          next.ttsText != null &&
          next.ttsText != prev?.ttsText &&
          !_isSpeaking) {
        _speakResponse(next.ttsText!);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation'),
        actions: [
          IconButton(
            icon: Icon(_ttsEnabled ? Icons.volume_up : Icons.volume_off),
            tooltip: _ttsEnabled ? 'TTS On' : 'TTS Off',
            onPressed: () {
              setState(() => _ttsEnabled = !_ttsEnabled);
              if (!_ttsEnabled) ref.read(ttsServiceProvider).stop();
            },
          ),
          if (_isSpeaking)
            IconButton(
              icon: const Icon(Icons.stop_circle),
              tooltip: 'Stop speaking',
              onPressed: () {
                ref.read(ttsServiceProvider).stop();
                setState(() => _isSpeaking = false);
              },
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

          // Input bar (hidden when session complete)
          if (!state.sessionComplete)
            _InputBar(
              controller: _textController,
              onSend: _sendMessage,
              onVoiceResult: _sendMessage,
              isLoading: state.isLoading,
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
    required this.onVoiceResult,
    required this.isLoading,
  });

  final TextEditingController controller;
  final Future<void> Function(String) onSend;
  final Future<void> Function(String) onVoiceResult;
  final bool isLoading;

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
          VoiceInputButton(onResult: onVoiceResult),
          const SizedBox(width: 8),
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
