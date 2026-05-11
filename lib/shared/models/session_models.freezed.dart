// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  String get id => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get inputType => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
    MessageModel value,
    $Res Function(MessageModel) then,
  ) = _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call({
    String id,
    String role,
    String content,
    String? inputType,
    String createdAt,
  });
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? inputType = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            inputType: freezed == inputType
                ? _value.inputType
                : inputType // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
    _$MessageModelImpl value,
    $Res Function(_$MessageModelImpl) then,
  ) = __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String role,
    String content,
    String? inputType,
    String createdAt,
  });
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
    _$MessageModelImpl _value,
    $Res Function(_$MessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? inputType = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$MessageModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        inputType: freezed == inputType
            ? _value.inputType
            : inputType // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  const _$MessageModelImpl({
    required this.id,
    required this.role,
    required this.content,
    this.inputType,
    required this.createdAt,
  });

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String role;
  @override
  final String content;
  @override
  final String? inputType;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'MessageModel(id: $id, role: $role, content: $content, inputType: $inputType, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, role, content, inputType, createdAt);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(this);
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel({
    required final String id,
    required final String role,
    required final String content,
    final String? inputType,
    required final String createdAt,
  }) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get role;
  @override
  String get content;
  @override
  String? get inputType;
  @override
  String get createdAt;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TriageResult _$TriageResultFromJson(Map<String, dynamic> json) {
  return _TriageResult.fromJson(json);
}

/// @nodoc
mixin _$TriageResult {
  String get level => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  List<String> get nextSteps => throw _privateConstructorUsedError;
  String get disclaimer => throw _privateConstructorUsedError;
  List<String> get emergencyKeywordsDetected =>
      throw _privateConstructorUsedError;

  /// Serializes this TriageResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TriageResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TriageResultCopyWith<TriageResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriageResultCopyWith<$Res> {
  factory $TriageResultCopyWith(
    TriageResult value,
    $Res Function(TriageResult) then,
  ) = _$TriageResultCopyWithImpl<$Res, TriageResult>;
  @useResult
  $Res call({
    String level,
    String? explanation,
    List<String> nextSteps,
    String disclaimer,
    List<String> emergencyKeywordsDetected,
  });
}

/// @nodoc
class _$TriageResultCopyWithImpl<$Res, $Val extends TriageResult>
    implements $TriageResultCopyWith<$Res> {
  _$TriageResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TriageResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? explanation = freezed,
    Object? nextSteps = null,
    Object? disclaimer = null,
    Object? emergencyKeywordsDetected = null,
  }) {
    return _then(
      _value.copyWith(
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
            explanation: freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextSteps: null == nextSteps
                ? _value.nextSteps
                : nextSteps // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            disclaimer: null == disclaimer
                ? _value.disclaimer
                : disclaimer // ignore: cast_nullable_to_non_nullable
                      as String,
            emergencyKeywordsDetected: null == emergencyKeywordsDetected
                ? _value.emergencyKeywordsDetected
                : emergencyKeywordsDetected // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TriageResultImplCopyWith<$Res>
    implements $TriageResultCopyWith<$Res> {
  factory _$$TriageResultImplCopyWith(
    _$TriageResultImpl value,
    $Res Function(_$TriageResultImpl) then,
  ) = __$$TriageResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String level,
    String? explanation,
    List<String> nextSteps,
    String disclaimer,
    List<String> emergencyKeywordsDetected,
  });
}

/// @nodoc
class __$$TriageResultImplCopyWithImpl<$Res>
    extends _$TriageResultCopyWithImpl<$Res, _$TriageResultImpl>
    implements _$$TriageResultImplCopyWith<$Res> {
  __$$TriageResultImplCopyWithImpl(
    _$TriageResultImpl _value,
    $Res Function(_$TriageResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TriageResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? explanation = freezed,
    Object? nextSteps = null,
    Object? disclaimer = null,
    Object? emergencyKeywordsDetected = null,
  }) {
    return _then(
      _$TriageResultImpl(
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
        explanation: freezed == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextSteps: null == nextSteps
            ? _value._nextSteps
            : nextSteps // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        disclaimer: null == disclaimer
            ? _value.disclaimer
            : disclaimer // ignore: cast_nullable_to_non_nullable
                  as String,
        emergencyKeywordsDetected: null == emergencyKeywordsDetected
            ? _value._emergencyKeywordsDetected
            : emergencyKeywordsDetected // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TriageResultImpl implements _TriageResult {
  const _$TriageResultImpl({
    required this.level,
    this.explanation,
    final List<String> nextSteps = const [],
    this.disclaimer =
        'This is not a medical diagnosis. CareBuddy is a triage assistance tool only. '
        'Always consult a qualified healthcare professional for medical advice.',
    final List<String> emergencyKeywordsDetected = const [],
  }) : _nextSteps = nextSteps,
       _emergencyKeywordsDetected = emergencyKeywordsDetected;

  factory _$TriageResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TriageResultImplFromJson(json);

  @override
  final String level;
  @override
  final String? explanation;
  final List<String> _nextSteps;
  @override
  @JsonKey()
  List<String> get nextSteps {
    if (_nextSteps is EqualUnmodifiableListView) return _nextSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextSteps);
  }

  @override
  @JsonKey()
  final String disclaimer;
  final List<String> _emergencyKeywordsDetected;
  @override
  @JsonKey()
  List<String> get emergencyKeywordsDetected {
    if (_emergencyKeywordsDetected is EqualUnmodifiableListView)
      return _emergencyKeywordsDetected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emergencyKeywordsDetected);
  }

  @override
  String toString() {
    return 'TriageResult(level: $level, explanation: $explanation, nextSteps: $nextSteps, disclaimer: $disclaimer, emergencyKeywordsDetected: $emergencyKeywordsDetected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TriageResultImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            const DeepCollectionEquality().equals(
              other._nextSteps,
              _nextSteps,
            ) &&
            (identical(other.disclaimer, disclaimer) ||
                other.disclaimer == disclaimer) &&
            const DeepCollectionEquality().equals(
              other._emergencyKeywordsDetected,
              _emergencyKeywordsDetected,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    level,
    explanation,
    const DeepCollectionEquality().hash(_nextSteps),
    disclaimer,
    const DeepCollectionEquality().hash(_emergencyKeywordsDetected),
  );

  /// Create a copy of TriageResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TriageResultImplCopyWith<_$TriageResultImpl> get copyWith =>
      __$$TriageResultImplCopyWithImpl<_$TriageResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TriageResultImplToJson(this);
  }
}

abstract class _TriageResult implements TriageResult {
  const factory _TriageResult({
    required final String level,
    final String? explanation,
    final List<String> nextSteps,
    final String disclaimer,
    final List<String> emergencyKeywordsDetected,
  }) = _$TriageResultImpl;

  factory _TriageResult.fromJson(Map<String, dynamic> json) =
      _$TriageResultImpl.fromJson;

  @override
  String get level;
  @override
  String? get explanation;
  @override
  List<String> get nextSteps;
  @override
  String get disclaimer;
  @override
  List<String> get emergencyKeywordsDetected;

  /// Create a copy of TriageResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TriageResultImplCopyWith<_$TriageResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  String get sessionId => throw _privateConstructorUsedError;
  String? get messageId => throw _privateConstructorUsedError;
  String get reply => throw _privateConstructorUsedError;
  String? get ttsText => throw _privateConstructorUsedError;
  List<String>? get quickReplyOptions => throw _privateConstructorUsedError;
  TriageResult? get triageResult => throw _privateConstructorUsedError;
  bool get isEmergency => throw _privateConstructorUsedError;
  bool get sessionComplete => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ChatResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
    ChatResponse value,
    $Res Function(ChatResponse) then,
  ) = _$ChatResponseCopyWithImpl<$Res, ChatResponse>;
  @useResult
  $Res call({
    String sessionId,
    String? messageId,
    String reply,
    String? ttsText,
    List<String>? quickReplyOptions,
    TriageResult? triageResult,
    bool isEmergency,
    bool sessionComplete,
    String? timestamp,
  });

  $TriageResultCopyWith<$Res>? get triageResult;
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res, $Val extends ChatResponse>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? messageId = freezed,
    Object? reply = null,
    Object? ttsText = freezed,
    Object? quickReplyOptions = freezed,
    Object? triageResult = freezed,
    Object? isEmergency = null,
    Object? sessionComplete = null,
    Object? timestamp = freezed,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            messageId: freezed == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            reply: null == reply
                ? _value.reply
                : reply // ignore: cast_nullable_to_non_nullable
                      as String,
            ttsText: freezed == ttsText
                ? _value.ttsText
                : ttsText // ignore: cast_nullable_to_non_nullable
                      as String?,
            quickReplyOptions: freezed == quickReplyOptions
                ? _value.quickReplyOptions
                : quickReplyOptions // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            triageResult: freezed == triageResult
                ? _value.triageResult
                : triageResult // ignore: cast_nullable_to_non_nullable
                      as TriageResult?,
            isEmergency: null == isEmergency
                ? _value.isEmergency
                : isEmergency // ignore: cast_nullable_to_non_nullable
                      as bool,
            sessionComplete: null == sessionComplete
                ? _value.sessionComplete
                : sessionComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TriageResultCopyWith<$Res>? get triageResult {
    if (_value.triageResult == null) {
      return null;
    }

    return $TriageResultCopyWith<$Res>(_value.triageResult!, (value) {
      return _then(_value.copyWith(triageResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatResponseImplCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$ChatResponseImplCopyWith(
    _$ChatResponseImpl value,
    $Res Function(_$ChatResponseImpl) then,
  ) = __$$ChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    String? messageId,
    String reply,
    String? ttsText,
    List<String>? quickReplyOptions,
    TriageResult? triageResult,
    bool isEmergency,
    bool sessionComplete,
    String? timestamp,
  });

  @override
  $TriageResultCopyWith<$Res>? get triageResult;
}

/// @nodoc
class __$$ChatResponseImplCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res, _$ChatResponseImpl>
    implements _$$ChatResponseImplCopyWith<$Res> {
  __$$ChatResponseImplCopyWithImpl(
    _$ChatResponseImpl _value,
    $Res Function(_$ChatResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? messageId = freezed,
    Object? reply = null,
    Object? ttsText = freezed,
    Object? quickReplyOptions = freezed,
    Object? triageResult = freezed,
    Object? isEmergency = null,
    Object? sessionComplete = null,
    Object? timestamp = freezed,
  }) {
    return _then(
      _$ChatResponseImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        messageId: freezed == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        reply: null == reply
            ? _value.reply
            : reply // ignore: cast_nullable_to_non_nullable
                  as String,
        ttsText: freezed == ttsText
            ? _value.ttsText
            : ttsText // ignore: cast_nullable_to_non_nullable
                  as String?,
        quickReplyOptions: freezed == quickReplyOptions
            ? _value._quickReplyOptions
            : quickReplyOptions // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        triageResult: freezed == triageResult
            ? _value.triageResult
            : triageResult // ignore: cast_nullable_to_non_nullable
                  as TriageResult?,
        isEmergency: null == isEmergency
            ? _value.isEmergency
            : isEmergency // ignore: cast_nullable_to_non_nullable
                  as bool,
        sessionComplete: null == sessionComplete
            ? _value.sessionComplete
            : sessionComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatResponseImpl implements _ChatResponse {
  const _$ChatResponseImpl({
    required this.sessionId,
    this.messageId,
    required this.reply,
    this.ttsText,
    final List<String>? quickReplyOptions,
    this.triageResult,
    this.isEmergency = false,
    this.sessionComplete = false,
    this.timestamp,
  }) : _quickReplyOptions = quickReplyOptions;

  factory _$ChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatResponseImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String? messageId;
  @override
  final String reply;
  @override
  final String? ttsText;
  final List<String>? _quickReplyOptions;
  @override
  List<String>? get quickReplyOptions {
    final value = _quickReplyOptions;
    if (value == null) return null;
    if (_quickReplyOptions is EqualUnmodifiableListView)
      return _quickReplyOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TriageResult? triageResult;
  @override
  @JsonKey()
  final bool isEmergency;
  @override
  @JsonKey()
  final bool sessionComplete;
  @override
  final String? timestamp;

  @override
  String toString() {
    return 'ChatResponse(sessionId: $sessionId, messageId: $messageId, reply: $reply, ttsText: $ttsText, quickReplyOptions: $quickReplyOptions, triageResult: $triageResult, isEmergency: $isEmergency, sessionComplete: $sessionComplete, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResponseImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.ttsText, ttsText) || other.ttsText == ttsText) &&
            const DeepCollectionEquality().equals(
              other._quickReplyOptions,
              _quickReplyOptions,
            ) &&
            (identical(other.triageResult, triageResult) ||
                other.triageResult == triageResult) &&
            (identical(other.isEmergency, isEmergency) ||
                other.isEmergency == isEmergency) &&
            (identical(other.sessionComplete, sessionComplete) ||
                other.sessionComplete == sessionComplete) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    messageId,
    reply,
    ttsText,
    const DeepCollectionEquality().hash(_quickReplyOptions),
    triageResult,
    isEmergency,
    sessionComplete,
    timestamp,
  );

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      __$$ChatResponseImplCopyWithImpl<_$ChatResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatResponseImplToJson(this);
  }
}

abstract class _ChatResponse implements ChatResponse {
  const factory _ChatResponse({
    required final String sessionId,
    final String? messageId,
    required final String reply,
    final String? ttsText,
    final List<String>? quickReplyOptions,
    final TriageResult? triageResult,
    final bool isEmergency,
    final bool sessionComplete,
    final String? timestamp,
  }) = _$ChatResponseImpl;

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$ChatResponseImpl.fromJson;

  @override
  String get sessionId;
  @override
  String? get messageId;
  @override
  String get reply;
  @override
  String? get ttsText;
  @override
  List<String>? get quickReplyOptions;
  @override
  TriageResult? get triageResult;
  @override
  bool get isEmergency;
  @override
  bool get sessionComplete;
  @override
  String? get timestamp;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) {
  return _SessionResponse.fromJson(json);
}

/// @nodoc
mixin _$SessionResponse {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get triageLevel => throw _privateConstructorUsedError;
  String? get triageExplanation => throw _privateConstructorUsedError;
  String? get primarySymptomTag => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  List<MessageModel> get messages => throw _privateConstructorUsedError;
  bool get contextInjected => throw _privateConstructorUsedError;

  /// Serializes this SessionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionResponseCopyWith<SessionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionResponseCopyWith<$Res> {
  factory $SessionResponseCopyWith(
    SessionResponse value,
    $Res Function(SessionResponse) then,
  ) = _$SessionResponseCopyWithImpl<$Res, SessionResponse>;
  @useResult
  $Res call({
    String id,
    String status,
    String? triageLevel,
    String? triageExplanation,
    String? primarySymptomTag,
    String? summary,
    String? startedAt,
    String? completedAt,
    int? durationSeconds,
    List<MessageModel> messages,
    bool contextInjected,
  });
}

/// @nodoc
class _$SessionResponseCopyWithImpl<$Res, $Val extends SessionResponse>
    implements $SessionResponseCopyWith<$Res> {
  _$SessionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? triageLevel = freezed,
    Object? triageExplanation = freezed,
    Object? primarySymptomTag = freezed,
    Object? summary = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? durationSeconds = freezed,
    Object? messages = null,
    Object? contextInjected = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            triageLevel: freezed == triageLevel
                ? _value.triageLevel
                : triageLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            triageExplanation: freezed == triageExplanation
                ? _value.triageExplanation
                : triageExplanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            primarySymptomTag: freezed == primarySymptomTag
                ? _value.primarySymptomTag
                : primarySymptomTag // ignore: cast_nullable_to_non_nullable
                      as String?,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            durationSeconds: freezed == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<MessageModel>,
            contextInjected: null == contextInjected
                ? _value.contextInjected
                : contextInjected // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionResponseImplCopyWith<$Res>
    implements $SessionResponseCopyWith<$Res> {
  factory _$$SessionResponseImplCopyWith(
    _$SessionResponseImpl value,
    $Res Function(_$SessionResponseImpl) then,
  ) = __$$SessionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String status,
    String? triageLevel,
    String? triageExplanation,
    String? primarySymptomTag,
    String? summary,
    String? startedAt,
    String? completedAt,
    int? durationSeconds,
    List<MessageModel> messages,
    bool contextInjected,
  });
}

/// @nodoc
class __$$SessionResponseImplCopyWithImpl<$Res>
    extends _$SessionResponseCopyWithImpl<$Res, _$SessionResponseImpl>
    implements _$$SessionResponseImplCopyWith<$Res> {
  __$$SessionResponseImplCopyWithImpl(
    _$SessionResponseImpl _value,
    $Res Function(_$SessionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? triageLevel = freezed,
    Object? triageExplanation = freezed,
    Object? primarySymptomTag = freezed,
    Object? summary = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? durationSeconds = freezed,
    Object? messages = null,
    Object? contextInjected = null,
  }) {
    return _then(
      _$SessionResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        triageLevel: freezed == triageLevel
            ? _value.triageLevel
            : triageLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        triageExplanation: freezed == triageExplanation
            ? _value.triageExplanation
            : triageExplanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        primarySymptomTag: freezed == primarySymptomTag
            ? _value.primarySymptomTag
            : primarySymptomTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        durationSeconds: freezed == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<MessageModel>,
        contextInjected: null == contextInjected
            ? _value.contextInjected
            : contextInjected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionResponseImpl implements _SessionResponse {
  const _$SessionResponseImpl({
    required this.id,
    this.status = 'active',
    this.triageLevel,
    this.triageExplanation,
    this.primarySymptomTag,
    this.summary,
    this.startedAt,
    this.completedAt,
    this.durationSeconds,
    final List<MessageModel> messages = const [],
    this.contextInjected = false,
  }) : _messages = messages;

  factory _$SessionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionResponseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String status;
  @override
  final String? triageLevel;
  @override
  final String? triageExplanation;
  @override
  final String? primarySymptomTag;
  @override
  final String? summary;
  @override
  final String? startedAt;
  @override
  final String? completedAt;
  @override
  final int? durationSeconds;
  final List<MessageModel> _messages;
  @override
  @JsonKey()
  List<MessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool contextInjected;

  @override
  String toString() {
    return 'SessionResponse(id: $id, status: $status, triageLevel: $triageLevel, triageExplanation: $triageExplanation, primarySymptomTag: $primarySymptomTag, summary: $summary, startedAt: $startedAt, completedAt: $completedAt, durationSeconds: $durationSeconds, messages: $messages, contextInjected: $contextInjected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.triageLevel, triageLevel) ||
                other.triageLevel == triageLevel) &&
            (identical(other.triageExplanation, triageExplanation) ||
                other.triageExplanation == triageExplanation) &&
            (identical(other.primarySymptomTag, primarySymptomTag) ||
                other.primarySymptomTag == primarySymptomTag) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.contextInjected, contextInjected) ||
                other.contextInjected == contextInjected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    status,
    triageLevel,
    triageExplanation,
    primarySymptomTag,
    summary,
    startedAt,
    completedAt,
    durationSeconds,
    const DeepCollectionEquality().hash(_messages),
    contextInjected,
  );

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionResponseImplCopyWith<_$SessionResponseImpl> get copyWith =>
      __$$SessionResponseImplCopyWithImpl<_$SessionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionResponseImplToJson(this);
  }
}

abstract class _SessionResponse implements SessionResponse {
  const factory _SessionResponse({
    required final String id,
    final String status,
    final String? triageLevel,
    final String? triageExplanation,
    final String? primarySymptomTag,
    final String? summary,
    final String? startedAt,
    final String? completedAt,
    final int? durationSeconds,
    final List<MessageModel> messages,
    final bool contextInjected,
  }) = _$SessionResponseImpl;

  factory _SessionResponse.fromJson(Map<String, dynamic> json) =
      _$SessionResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String? get triageLevel;
  @override
  String? get triageExplanation;
  @override
  String? get primarySymptomTag;
  @override
  String? get summary;
  @override
  String? get startedAt;
  @override
  String? get completedAt;
  @override
  int? get durationSeconds;
  @override
  List<MessageModel> get messages;
  @override
  bool get contextInjected;

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionResponseImplCopyWith<_$SessionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionSummary _$SessionSummaryFromJson(Map<String, dynamic> json) {
  return _SessionSummary.fromJson(json);
}

/// @nodoc
mixin _$SessionSummary {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get primarySymptomTag => throw _privateConstructorUsedError;
  String? get triageLevel => throw _privateConstructorUsedError;
  String? get startedAt => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;

  /// Serializes this SessionSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionSummaryCopyWith<SessionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionSummaryCopyWith<$Res> {
  factory $SessionSummaryCopyWith(
    SessionSummary value,
    $Res Function(SessionSummary) then,
  ) = _$SessionSummaryCopyWithImpl<$Res, SessionSummary>;
  @useResult
  $Res call({
    String id,
    String status,
    String? primarySymptomTag,
    String? triageLevel,
    String? startedAt,
    int? durationSeconds,
  });
}

/// @nodoc
class _$SessionSummaryCopyWithImpl<$Res, $Val extends SessionSummary>
    implements $SessionSummaryCopyWith<$Res> {
  _$SessionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? primarySymptomTag = freezed,
    Object? triageLevel = freezed,
    Object? startedAt = freezed,
    Object? durationSeconds = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            primarySymptomTag: freezed == primarySymptomTag
                ? _value.primarySymptomTag
                : primarySymptomTag // ignore: cast_nullable_to_non_nullable
                      as String?,
            triageLevel: freezed == triageLevel
                ? _value.triageLevel
                : triageLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            durationSeconds: freezed == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionSummaryImplCopyWith<$Res>
    implements $SessionSummaryCopyWith<$Res> {
  factory _$$SessionSummaryImplCopyWith(
    _$SessionSummaryImpl value,
    $Res Function(_$SessionSummaryImpl) then,
  ) = __$$SessionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String status,
    String? primarySymptomTag,
    String? triageLevel,
    String? startedAt,
    int? durationSeconds,
  });
}

/// @nodoc
class __$$SessionSummaryImplCopyWithImpl<$Res>
    extends _$SessionSummaryCopyWithImpl<$Res, _$SessionSummaryImpl>
    implements _$$SessionSummaryImplCopyWith<$Res> {
  __$$SessionSummaryImplCopyWithImpl(
    _$SessionSummaryImpl _value,
    $Res Function(_$SessionSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? primarySymptomTag = freezed,
    Object? triageLevel = freezed,
    Object? startedAt = freezed,
    Object? durationSeconds = freezed,
  }) {
    return _then(
      _$SessionSummaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        primarySymptomTag: freezed == primarySymptomTag
            ? _value.primarySymptomTag
            : primarySymptomTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        triageLevel: freezed == triageLevel
            ? _value.triageLevel
            : triageLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        durationSeconds: freezed == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionSummaryImpl implements _SessionSummary {
  const _$SessionSummaryImpl({
    required this.id,
    required this.status,
    this.primarySymptomTag,
    this.triageLevel,
    this.startedAt,
    this.durationSeconds,
  });

  factory _$SessionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionSummaryImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String? primarySymptomTag;
  @override
  final String? triageLevel;
  @override
  final String? startedAt;
  @override
  final int? durationSeconds;

  @override
  String toString() {
    return 'SessionSummary(id: $id, status: $status, primarySymptomTag: $primarySymptomTag, triageLevel: $triageLevel, startedAt: $startedAt, durationSeconds: $durationSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.primarySymptomTag, primarySymptomTag) ||
                other.primarySymptomTag == primarySymptomTag) &&
            (identical(other.triageLevel, triageLevel) ||
                other.triageLevel == triageLevel) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    status,
    primarySymptomTag,
    triageLevel,
    startedAt,
    durationSeconds,
  );

  /// Create a copy of SessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionSummaryImplCopyWith<_$SessionSummaryImpl> get copyWith =>
      __$$SessionSummaryImplCopyWithImpl<_$SessionSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionSummaryImplToJson(this);
  }
}

abstract class _SessionSummary implements SessionSummary {
  const factory _SessionSummary({
    required final String id,
    required final String status,
    final String? primarySymptomTag,
    final String? triageLevel,
    final String? startedAt,
    final int? durationSeconds,
  }) = _$SessionSummaryImpl;

  factory _SessionSummary.fromJson(Map<String, dynamic> json) =
      _$SessionSummaryImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String? get primarySymptomTag;
  @override
  String? get triageLevel;
  @override
  String? get startedAt;
  @override
  int? get durationSeconds;

  /// Create a copy of SessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionSummaryImplCopyWith<_$SessionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  int get page => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this PaginationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
    PaginationModel value,
    $Res Function(PaginationModel) then,
  ) = _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call({int page, int perPage, int totalCount, int totalPages});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            perPage: null == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$PaginationModelImplCopyWith(
    _$PaginationModelImpl value,
    $Res Function(_$PaginationModelImpl) then,
  ) = __$$PaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int perPage, int totalCount, int totalPages});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$PaginationModelImpl>
    implements _$$PaginationModelImplCopyWith<$Res> {
  __$$PaginationModelImplCopyWithImpl(
    _$PaginationModelImpl _value,
    $Res Function(_$PaginationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _$PaginationModelImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        perPage: null == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationModelImpl implements _PaginationModel {
  const _$PaginationModelImpl({
    required this.page,
    required this.perPage,
    required this.totalCount,
    required this.totalPages,
  });

  factory _$PaginationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationModelImplFromJson(json);

  @override
  final int page;
  @override
  final int perPage;
  @override
  final int totalCount;
  @override
  final int totalPages;

  @override
  String toString() {
    return 'PaginationModel(page: $page, perPage: $perPage, totalCount: $totalCount, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationModelImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, perPage, totalCount, totalPages);

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<_$PaginationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationModelImplToJson(this);
  }
}

abstract class _PaginationModel implements PaginationModel {
  const factory _PaginationModel({
    required final int page,
    required final int perPage,
    required final int totalCount,
    required final int totalPages,
  }) = _$PaginationModelImpl;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$PaginationModelImpl.fromJson;

  @override
  int get page;
  @override
  int get perPage;
  @override
  int get totalCount;
  @override
  int get totalPages;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionListResponse _$SessionListResponseFromJson(Map<String, dynamic> json) {
  return _SessionListResponse.fromJson(json);
}

/// @nodoc
mixin _$SessionListResponse {
  List<SessionSummary> get sessions => throw _privateConstructorUsedError;
  PaginationModel get pagination => throw _privateConstructorUsedError;

  /// Serializes this SessionListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionListResponseCopyWith<SessionListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionListResponseCopyWith<$Res> {
  factory $SessionListResponseCopyWith(
    SessionListResponse value,
    $Res Function(SessionListResponse) then,
  ) = _$SessionListResponseCopyWithImpl<$Res, SessionListResponse>;
  @useResult
  $Res call({List<SessionSummary> sessions, PaginationModel pagination});

  $PaginationModelCopyWith<$Res> get pagination;
}

/// @nodoc
class _$SessionListResponseCopyWithImpl<$Res, $Val extends SessionListResponse>
    implements $SessionListResponseCopyWith<$Res> {
  _$SessionListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessions = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            sessions: null == sessions
                ? _value.sessions
                : sessions // ignore: cast_nullable_to_non_nullable
                      as List<SessionSummary>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as PaginationModel,
          )
          as $Val,
    );
  }

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res> get pagination {
    return $PaginationModelCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionListResponseImplCopyWith<$Res>
    implements $SessionListResponseCopyWith<$Res> {
  factory _$$SessionListResponseImplCopyWith(
    _$SessionListResponseImpl value,
    $Res Function(_$SessionListResponseImpl) then,
  ) = __$$SessionListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SessionSummary> sessions, PaginationModel pagination});

  @override
  $PaginationModelCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$SessionListResponseImplCopyWithImpl<$Res>
    extends _$SessionListResponseCopyWithImpl<$Res, _$SessionListResponseImpl>
    implements _$$SessionListResponseImplCopyWith<$Res> {
  __$$SessionListResponseImplCopyWithImpl(
    _$SessionListResponseImpl _value,
    $Res Function(_$SessionListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sessions = null, Object? pagination = null}) {
    return _then(
      _$SessionListResponseImpl(
        sessions: null == sessions
            ? _value._sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<SessionSummary>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as PaginationModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionListResponseImpl implements _SessionListResponse {
  const _$SessionListResponseImpl({
    required final List<SessionSummary> sessions,
    required this.pagination,
  }) : _sessions = sessions;

  factory _$SessionListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionListResponseImplFromJson(json);

  final List<SessionSummary> _sessions;
  @override
  List<SessionSummary> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  final PaginationModel pagination;

  @override
  String toString() {
    return 'SessionListResponse(sessions: $sessions, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionListResponseImpl &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_sessions),
    pagination,
  );

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionListResponseImplCopyWith<_$SessionListResponseImpl> get copyWith =>
      __$$SessionListResponseImplCopyWithImpl<_$SessionListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionListResponseImplToJson(this);
  }
}

abstract class _SessionListResponse implements SessionListResponse {
  const factory _SessionListResponse({
    required final List<SessionSummary> sessions,
    required final PaginationModel pagination,
  }) = _$SessionListResponseImpl;

  factory _SessionListResponse.fromJson(Map<String, dynamic> json) =
      _$SessionListResponseImpl.fromJson;

  @override
  List<SessionSummary> get sessions;
  @override
  PaginationModel get pagination;

  /// Create a copy of SessionListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionListResponseImplCopyWith<_$SessionListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
