import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';

class ChatMessage {
  ChatMessage({required this.role, required this.content});
  final String role;
  final String content;
}

class ConsultationState {
  const ConsultationState({
    this.sessionId,
    this.messages = const [],
    this.triageResult,
    this.isEmergency = false,
    this.isLoading = false,
  });

  final String? sessionId;
  final List<ChatMessage> messages;
  final String? triageResult;
  final bool isEmergency;
  final bool isLoading;

  ConsultationState copyWith({
    String? sessionId,
    List<ChatMessage>? messages,
    String? triageResult,
    bool? isEmergency,
    bool? isLoading,
  }) =>
      ConsultationState(
        sessionId: sessionId ?? this.sessionId,
        messages: messages ?? this.messages,
        triageResult: triageResult ?? this.triageResult,
        isEmergency: isEmergency ?? this.isEmergency,
        isLoading: isLoading ?? this.isLoading,
      );
}

final consultationProvider =
    StateNotifierProvider<ConsultationNotifier, ConsultationState>((ref) {
  return ConsultationNotifier(ref);
});

class ConsultationNotifier extends StateNotifier<ConsultationState> {
  ConsultationNotifier(this._ref) : super(const ConsultationState());

  final Ref _ref;

  Future<void> init(String? existingSessionId) async {
    final dio = _ref.read(dioProvider);

    if (existingSessionId != null) {
      state = state.copyWith(sessionId: existingSessionId);
      return;
    }

    final response = await dio.post('/sessions');
    final sessionId = response.data['id'] as String;

    state = state.copyWith(
      sessionId: sessionId,
      messages: [
        ChatMessage(
          role: 'assistant',
          content:
              "Hello! I'm CareBuddy. I'm here to help assess your symptoms. Please note: I am not a medical professional and this is not a diagnosis. How are you feeling today?",
        ),
      ],
    );
  }

  Future<void> sendMessage(String text) async {
    if (state.sessionId == null) return;

    final dio = _ref.read(dioProvider);
    final updated = List<ChatMessage>.from(state.messages)
      ..add(ChatMessage(role: 'user', content: text));

    state = state.copyWith(messages: updated, isLoading: true);

    try {
      final response = await dio.post('/sessions/chat', data: {
        'session_id': state.sessionId,
        'message': text,
      });

      final reply = response.data['reply'] as String;
      final triageResult = response.data['triage_result'] as String?;
      final isEmergency = response.data['is_emergency'] as bool? ?? false;

      state = state.copyWith(
        messages: List<ChatMessage>.from(state.messages)
          ..add(ChatMessage(role: 'assistant', content: reply)),
        triageResult: triageResult ?? state.triageResult,
        isEmergency: isEmergency,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }
}
