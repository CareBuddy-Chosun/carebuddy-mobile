import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_models.freezed.dart';
part 'session_models.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String role,
    required String content,
    String? inputType,
    required String createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

@freezed
class TriageResult with _$TriageResult {
  const factory TriageResult({
    required String level,
    String? explanation,
    @Default([]) List<String> nextSteps,
    @Default(
      'This is not a medical diagnosis. CareBuddy is a triage assistance tool only. '
      'Always consult a qualified healthcare professional for medical advice.',
    )
    String disclaimer,
    @Default([]) List<String> emergencyKeywordsDetected,
  }) = _TriageResult;

  factory TriageResult.fromJson(Map<String, dynamic> json) =>
      _$TriageResultFromJson(json);
}

@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    required String sessionId,
    String? messageId,
    required String reply,
    String? ttsText,
    List<String>? quickReplyOptions,
    TriageResult? triageResult,
    @Default(false) bool isEmergency,
    @Default(false) bool sessionComplete,
    String? timestamp,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

@freezed
class SessionResponse with _$SessionResponse {
  const factory SessionResponse({
    required String id,
    @Default('active') String status,
    String? triageLevel,
    String? triageExplanation,
    String? primarySymptomTag,
    String? summary,
    String? startedAt,
    String? completedAt,
    int? durationSeconds,
    @Default([]) List<MessageModel> messages,
    @Default(false) bool contextInjected,
  }) = _SessionResponse;

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);
}

@freezed
class SessionSummary with _$SessionSummary {
  const factory SessionSummary({
    required String id,
    required String status,
    String? primarySymptomTag,
    String? triageLevel,
    String? startedAt,
    int? durationSeconds,
  }) = _SessionSummary;

  factory SessionSummary.fromJson(Map<String, dynamic> json) =>
      _$SessionSummaryFromJson(json);
}

@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    required int page,
    required int perPage,
    required int totalCount,
    required int totalPages,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}

@freezed
class SessionListResponse with _$SessionListResponse {
  const factory SessionListResponse({
    required List<SessionSummary> sessions,
    required PaginationModel pagination,
  }) = _SessionListResponse;

  factory SessionListResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionListResponseFromJson(json);
}
