import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/providers/language_provider.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/session_repository.dart';
import '../../../../core/services/emergency_detector.dart';
import '../../../../shared/models/session_models.dart';

class ChatMessage {
  ChatMessage({required this.role, required this.content, this.timestamp});
  final String role;
  final String content;
  final String? timestamp;
}

class ConsultationState {
  const ConsultationState({
    this.sessionId,
    this.messages = const [],
    this.triageResult,
    this.isEmergency = false,
    this.isLoading = false,
    this.sessionComplete = false,
    this.quickReplyOptions,
    this.ttsText,
    this.error,
  });

  final String? sessionId;
  final List<ChatMessage> messages;
  final TriageResult? triageResult;
  final bool isEmergency;
  final bool isLoading;
  final bool sessionComplete;
  final List<String>? quickReplyOptions;
  final String? ttsText;
  final String? error;

  ConsultationState copyWith({
    String? sessionId,
    List<ChatMessage>? messages,
    TriageResult? triageResult,
    bool? isEmergency,
    bool? isLoading,
    bool? sessionComplete,
    List<String>? quickReplyOptions,
    String? ttsText,
    String? error,
  }) =>
      ConsultationState(
        sessionId: sessionId ?? this.sessionId,
        messages: messages ?? this.messages,
        triageResult: triageResult ?? this.triageResult,
        isEmergency: isEmergency ?? this.isEmergency,
        isLoading: isLoading ?? this.isLoading,
        sessionComplete: sessionComplete ?? this.sessionComplete,
        quickReplyOptions: quickReplyOptions,
        ttsText: ttsText,
        error: error,
      );
}

final consultationProvider =
    StateNotifierProvider.autoDispose<ConsultationNotifier, ConsultationState>(
        (ref) {
  return ConsultationNotifier(ref);
});

class ConsultationNotifier extends StateNotifier<ConsultationState> {
  ConsultationNotifier(this._ref) : super(const ConsultationState());

  final Ref _ref;

  Future<void> init(String? existingSessionId) async {
    final repo = _ref.read(sessionRepositoryProvider);

    // Always start from a clean slate so a previous (completed) session's
    // triage result / sessionComplete flag never leaks into a new chat and
    // blocks the input bar.
    state = const ConsultationState();

    try {
      if (existingSessionId != null) {
        // Load existing session with full message history
        final session = await repo.getSession(existingSessionId);
        final messages = session.messages
            .map((m) => ChatMessage(
                  role: m.role,
                  content: m.content,
                  timestamp: m.createdAt,
                ))
            .toList();

        state = ConsultationState(
          sessionId: session.id,
          messages: messages,
          sessionComplete: session.status != 'active',
          triageResult: session.triageLevel != null
              ? TriageResult(level: session.triageLevel!)
              : null,
          isEmergency: session.triageLevel == 'EMERGENCY',
        );
        return;
      }

      // Create new session
      final session = await repo.createSession();

      // If session already has messages (e.g., greeting from backend)
      final messages = session.messages
          .map((m) => ChatMessage(
                role: m.role,
                content: m.content,
                timestamp: m.createdAt,
              ))
          .toList();

      // Add client-side greeting if no messages exist
      String? greeting;
      if (messages.isEmpty) {
        greeting = _ref.read(stringsProvider).consultationGreeting;
        messages.add(ChatMessage(role: 'assistant', content: greeting));
      }

      // Surface the greeting via ttsText so the screen's auto-play path can
      // speak it on open (FR-006). When the session was created server-side
      // with messages, we still speak the first assistant message.
      final spokenGreeting = greeting ??
          (messages.isNotEmpty && messages.first.role == 'assistant'
              ? messages.first.content
              : null);

      state = ConsultationState(
        sessionId: session.id,
        messages: messages,
        ttsText: spokenGreeting,
      );
    } catch (e) {
      final msg = e is ApiException ? e.userMessage : e.toString();
      state = state.copyWith(error: msg);
    }
  }

  Future<void> sendMessage(String text, {String inputType = 'text'}) async {
    if (state.sessionId == null || state.sessionComplete) return;

    final repo = _ref.read(sessionRepositoryProvider);

    // Add user message to UI immediately
    final updated = List<ChatMessage>.from(state.messages)
      ..add(ChatMessage(role: 'user', content: text));

    // Client-side emergency keyword detection (SRS FR-015)
    final emergencyKeywords = EmergencyDetector.check(text);
    final clientEmergency = emergencyKeywords.isNotEmpty;

    state = state.copyWith(
      messages: updated,
      isLoading: true,
      isEmergency: clientEmergency || state.isEmergency,
      quickReplyOptions: null,
    );

    try {
      final response = await repo.sendMessage(
        state.sessionId!,
        content: text,
        inputType: inputType,
        language: _ref.read(languageProvider),
      );

      final newMessages = List<ChatMessage>.from(state.messages)
        ..add(ChatMessage(
          role: 'assistant',
          content: response.reply,
          timestamp: response.timestamp,
        ));

      state = state.copyWith(
        messages: newMessages,
        triageResult: response.triageResult ?? state.triageResult,
        isEmergency: response.isEmergency || state.isEmergency,
        sessionComplete: response.sessionComplete,
        quickReplyOptions: response.quickReplyOptions,
        ttsText: response.ttsText,
        isLoading: false,
      );
    } catch (e) {
      final msg = e is ApiException ? e.userMessage : e.toString();
      state = state.copyWith(isLoading: false, error: msg);
    }
  }

  /// Triggers guardian notification. Returns the number of guardians notified
  /// (0 if none registered), or -1 on error. SMS delivery is stubbed on the
  /// backend — the count reflects who *would* be notified.
  Future<int> notifyGuardians() async {
    if (state.sessionId == null) return -1;
    final repo = _ref.read(sessionRepositoryProvider);
    try {
      final response = await repo.notifyGuardians(state.sessionId!);
      return response.notifications.length;
    } catch (e) {
      final msg = e is ApiException ? e.userMessage : e.toString();
      state = state.copyWith(error: msg);
      return -1;
    }
  }
}
