import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_theme.dart';
import '../providers/consultation_provider.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/voice_input_button.dart';
import '../widgets/triage_result_banner.dart';

class ConsultationScreen extends ConsumerStatefulWidget {
  const ConsultationScreen({super.key, this.sessionId});

  final String? sessionId;

  @override
  ConsumerState<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends ConsumerState<ConsultationScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

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

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    _textController.clear();
    await ref.read(consultationProvider.notifier).sendMessage(text.trim());
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(consultationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation'),
        bottom: state.triageResult != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: TriageResultBanner(result: state.triageResult!),
              )
            : null,
      ),
      body: Column(
        children: [
          if (state.isEmergency)
            Container(
              width: double.infinity,
              color: AppTheme.emergency,
              padding: const EdgeInsets.all(12),
              child: const Text(
                '🚨 EMERGENCY — Call 911 immediately',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: state.messages.length,
              itemBuilder: (context, i) => ChatBubble(message: state.messages[i]),
            ),
          ),
          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
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
