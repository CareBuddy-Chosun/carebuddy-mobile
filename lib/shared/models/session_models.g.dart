// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as String,
      role: json['role'] as String,
      content: json['content'] as String,
      inputType: json['input_type'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'content': instance.content,
      'input_type': instance.inputType,
      'created_at': instance.createdAt,
    };

_$TriageResultImpl _$$TriageResultImplFromJson(
  Map<String, dynamic> json,
) => _$TriageResultImpl(
  level: json['level'] as String,
  explanation: json['explanation'] as String?,
  recommendedDepartment: json['recommended_department'] as String?,
  nextSteps:
      (json['next_steps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  disclaimer:
      json['disclaimer'] as String? ??
      'This is not a medical diagnosis. CareBuddy is a triage assistance tool only. '
          'Always consult a qualified healthcare professional for medical advice.',
  emergencyKeywordsDetected:
      (json['emergency_keywords_detected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TriageResultImplToJson(_$TriageResultImpl instance) =>
    <String, dynamic>{
      'level': instance.level,
      'explanation': instance.explanation,
      'recommended_department': instance.recommendedDepartment,
      'next_steps': instance.nextSteps,
      'disclaimer': instance.disclaimer,
      'emergency_keywords_detected': instance.emergencyKeywordsDetected,
    };

_$ChatResponseImpl _$$ChatResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChatResponseImpl(
      sessionId: json['session_id'] as String,
      messageId: json['message_id'] as String?,
      reply: json['reply'] as String,
      ttsText: json['tts_text'] as String?,
      quickReplyOptions: (json['quick_reply_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      triageResult: json['triage_result'] == null
          ? null
          : TriageResult.fromJson(
              json['triage_result'] as Map<String, dynamic>,
            ),
      isEmergency: json['is_emergency'] as bool? ?? false,
      sessionComplete: json['session_complete'] as bool? ?? false,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$$ChatResponseImplToJson(_$ChatResponseImpl instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'message_id': instance.messageId,
      'reply': instance.reply,
      'tts_text': instance.ttsText,
      'quick_reply_options': instance.quickReplyOptions,
      'triage_result': instance.triageResult?.toJson(),
      'is_emergency': instance.isEmergency,
      'session_complete': instance.sessionComplete,
      'timestamp': instance.timestamp,
    };

_$SessionResponseImpl _$$SessionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SessionResponseImpl(
  id: json['id'] as String,
  status: json['status'] as String? ?? 'active',
  triageLevel: json['triage_level'] as String?,
  triageExplanation: json['triage_explanation'] as String?,
  primarySymptomTag: json['primary_symptom_tag'] as String?,
  summary: json['summary'] as String?,
  startedAt: json['started_at'] as String?,
  completedAt: json['completed_at'] as String?,
  durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  contextInjected: json['context_injected'] as bool? ?? false,
);

Map<String, dynamic> _$$SessionResponseImplToJson(
  _$SessionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'triage_level': instance.triageLevel,
  'triage_explanation': instance.triageExplanation,
  'primary_symptom_tag': instance.primarySymptomTag,
  'summary': instance.summary,
  'started_at': instance.startedAt,
  'completed_at': instance.completedAt,
  'duration_seconds': instance.durationSeconds,
  'messages': instance.messages.map((e) => e.toJson()).toList(),
  'context_injected': instance.contextInjected,
};

_$SessionSummaryImpl _$$SessionSummaryImplFromJson(Map<String, dynamic> json) =>
    _$SessionSummaryImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      primarySymptomTag: json['primary_symptom_tag'] as String?,
      triageLevel: json['triage_level'] as String?,
      startedAt: json['started_at'] as String?,
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SessionSummaryImplToJson(
  _$SessionSummaryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'primary_symptom_tag': instance.primarySymptomTag,
  'triage_level': instance.triageLevel,
  'started_at': instance.startedAt,
  'duration_seconds': instance.durationSeconds,
};

_$PaginationModelImpl _$$PaginationModelImplFromJson(
  Map<String, dynamic> json,
) => _$PaginationModelImpl(
  page: (json['page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  totalCount: (json['total_count'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);

Map<String, dynamic> _$$PaginationModelImplToJson(
  _$PaginationModelImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'per_page': instance.perPage,
  'total_count': instance.totalCount,
  'total_pages': instance.totalPages,
};

_$SessionListResponseImpl _$$SessionListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SessionListResponseImpl(
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => SessionSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: PaginationModel.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$SessionListResponseImplToJson(
  _$SessionListResponseImpl instance,
) => <String, dynamic>{
  'sessions': instance.sessions.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};
