// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GuardianNotification _$GuardianNotificationFromJson(Map<String, dynamic> json) {
  return _GuardianNotification.fromJson(json);
}

/// @nodoc
mixin _$GuardianNotification {
  String get guardianName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this GuardianNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuardianNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuardianNotificationCopyWith<GuardianNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuardianNotificationCopyWith<$Res> {
  factory $GuardianNotificationCopyWith(
    GuardianNotification value,
    $Res Function(GuardianNotification) then,
  ) = _$GuardianNotificationCopyWithImpl<$Res, GuardianNotification>;
  @useResult
  $Res call({String guardianName, String phone, String status});
}

/// @nodoc
class _$GuardianNotificationCopyWithImpl<
  $Res,
  $Val extends GuardianNotification
>
    implements $GuardianNotificationCopyWith<$Res> {
  _$GuardianNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuardianNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guardianName = null,
    Object? phone = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            guardianName: null == guardianName
                ? _value.guardianName
                : guardianName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuardianNotificationImplCopyWith<$Res>
    implements $GuardianNotificationCopyWith<$Res> {
  factory _$$GuardianNotificationImplCopyWith(
    _$GuardianNotificationImpl value,
    $Res Function(_$GuardianNotificationImpl) then,
  ) = __$$GuardianNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String guardianName, String phone, String status});
}

/// @nodoc
class __$$GuardianNotificationImplCopyWithImpl<$Res>
    extends _$GuardianNotificationCopyWithImpl<$Res, _$GuardianNotificationImpl>
    implements _$$GuardianNotificationImplCopyWith<$Res> {
  __$$GuardianNotificationImplCopyWithImpl(
    _$GuardianNotificationImpl _value,
    $Res Function(_$GuardianNotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuardianNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guardianName = null,
    Object? phone = null,
    Object? status = null,
  }) {
    return _then(
      _$GuardianNotificationImpl(
        guardianName: null == guardianName
            ? _value.guardianName
            : guardianName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuardianNotificationImpl implements _GuardianNotification {
  const _$GuardianNotificationImpl({
    required this.guardianName,
    required this.phone,
    required this.status,
  });

  factory _$GuardianNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuardianNotificationImplFromJson(json);

  @override
  final String guardianName;
  @override
  final String phone;
  @override
  final String status;

  @override
  String toString() {
    return 'GuardianNotification(guardianName: $guardianName, phone: $phone, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuardianNotificationImpl &&
            (identical(other.guardianName, guardianName) ||
                other.guardianName == guardianName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, guardianName, phone, status);

  /// Create a copy of GuardianNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuardianNotificationImplCopyWith<_$GuardianNotificationImpl>
  get copyWith =>
      __$$GuardianNotificationImplCopyWithImpl<_$GuardianNotificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GuardianNotificationImplToJson(this);
  }
}

abstract class _GuardianNotification implements GuardianNotification {
  const factory _GuardianNotification({
    required final String guardianName,
    required final String phone,
    required final String status,
  }) = _$GuardianNotificationImpl;

  factory _GuardianNotification.fromJson(Map<String, dynamic> json) =
      _$GuardianNotificationImpl.fromJson;

  @override
  String get guardianName;
  @override
  String get phone;
  @override
  String get status;

  /// Create a copy of GuardianNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuardianNotificationImplCopyWith<_$GuardianNotificationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

NotificationResponse _$NotificationResponseFromJson(Map<String, dynamic> json) {
  return _NotificationResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationResponse {
  List<GuardianNotification> get notifications =>
      throw _privateConstructorUsedError;

  /// Serializes this NotificationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationResponseCopyWith<NotificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationResponseCopyWith<$Res> {
  factory $NotificationResponseCopyWith(
    NotificationResponse value,
    $Res Function(NotificationResponse) then,
  ) = _$NotificationResponseCopyWithImpl<$Res, NotificationResponse>;
  @useResult
  $Res call({List<GuardianNotification> notifications});
}

/// @nodoc
class _$NotificationResponseCopyWithImpl<
  $Res,
  $Val extends NotificationResponse
>
    implements $NotificationResponseCopyWith<$Res> {
  _$NotificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notifications = null}) {
    return _then(
      _value.copyWith(
            notifications: null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                      as List<GuardianNotification>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationResponseImplCopyWith<$Res>
    implements $NotificationResponseCopyWith<$Res> {
  factory _$$NotificationResponseImplCopyWith(
    _$NotificationResponseImpl value,
    $Res Function(_$NotificationResponseImpl) then,
  ) = __$$NotificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GuardianNotification> notifications});
}

/// @nodoc
class __$$NotificationResponseImplCopyWithImpl<$Res>
    extends _$NotificationResponseCopyWithImpl<$Res, _$NotificationResponseImpl>
    implements _$$NotificationResponseImplCopyWith<$Res> {
  __$$NotificationResponseImplCopyWithImpl(
    _$NotificationResponseImpl _value,
    $Res Function(_$NotificationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notifications = null}) {
    return _then(
      _$NotificationResponseImpl(
        notifications: null == notifications
            ? _value._notifications
            : notifications // ignore: cast_nullable_to_non_nullable
                  as List<GuardianNotification>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationResponseImpl implements _NotificationResponse {
  const _$NotificationResponseImpl({
    required final List<GuardianNotification> notifications,
  }) : _notifications = notifications;

  factory _$NotificationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationResponseImplFromJson(json);

  final List<GuardianNotification> _notifications;
  @override
  List<GuardianNotification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationResponse(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationResponseImpl &&
            const DeepCollectionEquality().equals(
              other._notifications,
              _notifications,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_notifications),
  );

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationResponseImplCopyWith<_$NotificationResponseImpl>
  get copyWith =>
      __$$NotificationResponseImplCopyWithImpl<_$NotificationResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationResponseImplToJson(this);
  }
}

abstract class _NotificationResponse implements NotificationResponse {
  const factory _NotificationResponse({
    required final List<GuardianNotification> notifications,
  }) = _$NotificationResponseImpl;

  factory _NotificationResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationResponseImpl.fromJson;

  @override
  List<GuardianNotification> get notifications;

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationResponseImplCopyWith<_$NotificationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
