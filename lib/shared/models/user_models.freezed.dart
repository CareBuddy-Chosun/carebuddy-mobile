// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Guardian _$GuardianFromJson(Map<String, dynamic> json) {
  return _Guardian.fromJson(json);
}

/// @nodoc
mixin _$Guardian {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get relationship => throw _privateConstructorUsedError;

  /// Serializes this Guardian to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Guardian
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuardianCopyWith<Guardian> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuardianCopyWith<$Res> {
  factory $GuardianCopyWith(Guardian value, $Res Function(Guardian) then) =
      _$GuardianCopyWithImpl<$Res, Guardian>;
  @useResult
  $Res call({String id, String name, String phone, String? relationship});
}

/// @nodoc
class _$GuardianCopyWithImpl<$Res, $Val extends Guardian>
    implements $GuardianCopyWith<$Res> {
  _$GuardianCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Guardian
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? relationship = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            relationship: freezed == relationship
                ? _value.relationship
                : relationship // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuardianImplCopyWith<$Res>
    implements $GuardianCopyWith<$Res> {
  factory _$$GuardianImplCopyWith(
    _$GuardianImpl value,
    $Res Function(_$GuardianImpl) then,
  ) = __$$GuardianImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String phone, String? relationship});
}

/// @nodoc
class __$$GuardianImplCopyWithImpl<$Res>
    extends _$GuardianCopyWithImpl<$Res, _$GuardianImpl>
    implements _$$GuardianImplCopyWith<$Res> {
  __$$GuardianImplCopyWithImpl(
    _$GuardianImpl _value,
    $Res Function(_$GuardianImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Guardian
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? relationship = freezed,
  }) {
    return _then(
      _$GuardianImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        relationship: freezed == relationship
            ? _value.relationship
            : relationship // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuardianImpl implements _Guardian {
  const _$GuardianImpl({
    required this.id,
    required this.name,
    required this.phone,
    this.relationship,
  });

  factory _$GuardianImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuardianImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? relationship;

  @override
  String toString() {
    return 'Guardian(id: $id, name: $name, phone: $phone, relationship: $relationship)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuardianImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, relationship);

  /// Create a copy of Guardian
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuardianImplCopyWith<_$GuardianImpl> get copyWith =>
      __$$GuardianImplCopyWithImpl<_$GuardianImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuardianImplToJson(this);
  }
}

abstract class _Guardian implements Guardian {
  const factory _Guardian({
    required final String id,
    required final String name,
    required final String phone,
    final String? relationship,
  }) = _$GuardianImpl;

  factory _Guardian.fromJson(Map<String, dynamic> json) =
      _$GuardianImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String? get relationship;

  /// Create a copy of Guardian
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuardianImplCopyWith<_$GuardianImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get userId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  bool get consentDataStorage => throw _privateConstructorUsedError;
  List<Guardian> get guardians => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get sessionCount => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    String userId,
    String email,
    String fullName,
    String? dateOfBirth,
    bool consentDataStorage,
    List<Guardian> guardians,
    String createdAt,
    int sessionCount,
  });
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? fullName = null,
    Object? dateOfBirth = freezed,
    Object? consentDataStorage = null,
    Object? guardians = null,
    Object? createdAt = null,
    Object? sessionCount = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            consentDataStorage: null == consentDataStorage
                ? _value.consentDataStorage
                : consentDataStorage // ignore: cast_nullable_to_non_nullable
                      as bool,
            guardians: null == guardians
                ? _value.guardians
                : guardians // ignore: cast_nullable_to_non_nullable
                      as List<Guardian>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionCount: null == sessionCount
                ? _value.sessionCount
                : sessionCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String email,
    String fullName,
    String? dateOfBirth,
    bool consentDataStorage,
    List<Guardian> guardians,
    String createdAt,
    int sessionCount,
  });
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? fullName = null,
    Object? dateOfBirth = freezed,
    Object? consentDataStorage = null,
    Object? guardians = null,
    Object? createdAt = null,
    Object? sessionCount = null,
  }) {
    return _then(
      _$UserProfileImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        consentDataStorage: null == consentDataStorage
            ? _value.consentDataStorage
            : consentDataStorage // ignore: cast_nullable_to_non_nullable
                  as bool,
        guardians: null == guardians
            ? _value._guardians
            : guardians // ignore: cast_nullable_to_non_nullable
                  as List<Guardian>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionCount: null == sessionCount
            ? _value.sessionCount
            : sessionCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    required this.userId,
    required this.email,
    required this.fullName,
    this.dateOfBirth,
    this.consentDataStorage = false,
    final List<Guardian> guardians = const [],
    required this.createdAt,
    this.sessionCount = 0,
  }) : _guardians = guardians;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String userId;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String? dateOfBirth;
  @override
  @JsonKey()
  final bool consentDataStorage;
  final List<Guardian> _guardians;
  @override
  @JsonKey()
  List<Guardian> get guardians {
    if (_guardians is EqualUnmodifiableListView) return _guardians;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guardians);
  }

  @override
  final String createdAt;
  @override
  @JsonKey()
  final int sessionCount;

  @override
  String toString() {
    return 'UserProfile(userId: $userId, email: $email, fullName: $fullName, dateOfBirth: $dateOfBirth, consentDataStorage: $consentDataStorage, guardians: $guardians, createdAt: $createdAt, sessionCount: $sessionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.consentDataStorage, consentDataStorage) ||
                other.consentDataStorage == consentDataStorage) &&
            const DeepCollectionEquality().equals(
              other._guardians,
              _guardians,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sessionCount, sessionCount) ||
                other.sessionCount == sessionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    email,
    fullName,
    dateOfBirth,
    consentDataStorage,
    const DeepCollectionEquality().hash(_guardians),
    createdAt,
    sessionCount,
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    required final String userId,
    required final String email,
    required final String fullName,
    final String? dateOfBirth,
    final bool consentDataStorage,
    final List<Guardian> guardians,
    required final String createdAt,
    final int sessionCount,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get userId;
  @override
  String get email;
  @override
  String get fullName;
  @override
  String? get dateOfBirth;
  @override
  bool get consentDataStorage;
  @override
  List<Guardian> get guardians;
  @override
  String get createdAt;
  @override
  int get sessionCount;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuardianCreate _$GuardianCreateFromJson(Map<String, dynamic> json) {
  return _GuardianCreate.fromJson(json);
}

/// @nodoc
mixin _$GuardianCreate {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get relationship => throw _privateConstructorUsedError;

  /// Serializes this GuardianCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuardianCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuardianCreateCopyWith<GuardianCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuardianCreateCopyWith<$Res> {
  factory $GuardianCreateCopyWith(
    GuardianCreate value,
    $Res Function(GuardianCreate) then,
  ) = _$GuardianCreateCopyWithImpl<$Res, GuardianCreate>;
  @useResult
  $Res call({String name, String phone, String? relationship});
}

/// @nodoc
class _$GuardianCreateCopyWithImpl<$Res, $Val extends GuardianCreate>
    implements $GuardianCreateCopyWith<$Res> {
  _$GuardianCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuardianCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? relationship = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            relationship: freezed == relationship
                ? _value.relationship
                : relationship // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuardianCreateImplCopyWith<$Res>
    implements $GuardianCreateCopyWith<$Res> {
  factory _$$GuardianCreateImplCopyWith(
    _$GuardianCreateImpl value,
    $Res Function(_$GuardianCreateImpl) then,
  ) = __$$GuardianCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone, String? relationship});
}

/// @nodoc
class __$$GuardianCreateImplCopyWithImpl<$Res>
    extends _$GuardianCreateCopyWithImpl<$Res, _$GuardianCreateImpl>
    implements _$$GuardianCreateImplCopyWith<$Res> {
  __$$GuardianCreateImplCopyWithImpl(
    _$GuardianCreateImpl _value,
    $Res Function(_$GuardianCreateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuardianCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? relationship = freezed,
  }) {
    return _then(
      _$GuardianCreateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        relationship: freezed == relationship
            ? _value.relationship
            : relationship // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuardianCreateImpl implements _GuardianCreate {
  const _$GuardianCreateImpl({
    required this.name,
    required this.phone,
    this.relationship,
  });

  factory _$GuardianCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuardianCreateImplFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String? relationship;

  @override
  String toString() {
    return 'GuardianCreate(name: $name, phone: $phone, relationship: $relationship)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuardianCreateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, relationship);

  /// Create a copy of GuardianCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuardianCreateImplCopyWith<_$GuardianCreateImpl> get copyWith =>
      __$$GuardianCreateImplCopyWithImpl<_$GuardianCreateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GuardianCreateImplToJson(this);
  }
}

abstract class _GuardianCreate implements GuardianCreate {
  const factory _GuardianCreate({
    required final String name,
    required final String phone,
    final String? relationship,
  }) = _$GuardianCreateImpl;

  factory _GuardianCreate.fromJson(Map<String, dynamic> json) =
      _$GuardianCreateImpl.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  String? get relationship;

  /// Create a copy of GuardianCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuardianCreateImplCopyWith<_$GuardianCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileUpdate _$UserProfileUpdateFromJson(Map<String, dynamic> json) {
  return _UserProfileUpdate.fromJson(json);
}

/// @nodoc
mixin _$UserProfileUpdate {
  String? get fullName => throw _privateConstructorUsedError;
  bool? get consentDataStorage => throw _privateConstructorUsedError;

  /// Serializes this UserProfileUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileUpdateCopyWith<UserProfileUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileUpdateCopyWith<$Res> {
  factory $UserProfileUpdateCopyWith(
    UserProfileUpdate value,
    $Res Function(UserProfileUpdate) then,
  ) = _$UserProfileUpdateCopyWithImpl<$Res, UserProfileUpdate>;
  @useResult
  $Res call({String? fullName, bool? consentDataStorage});
}

/// @nodoc
class _$UserProfileUpdateCopyWithImpl<$Res, $Val extends UserProfileUpdate>
    implements $UserProfileUpdateCopyWith<$Res> {
  _$UserProfileUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? consentDataStorage = freezed,
  }) {
    return _then(
      _value.copyWith(
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            consentDataStorage: freezed == consentDataStorage
                ? _value.consentDataStorage
                : consentDataStorage // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProfileUpdateImplCopyWith<$Res>
    implements $UserProfileUpdateCopyWith<$Res> {
  factory _$$UserProfileUpdateImplCopyWith(
    _$UserProfileUpdateImpl value,
    $Res Function(_$UserProfileUpdateImpl) then,
  ) = __$$UserProfileUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fullName, bool? consentDataStorage});
}

/// @nodoc
class __$$UserProfileUpdateImplCopyWithImpl<$Res>
    extends _$UserProfileUpdateCopyWithImpl<$Res, _$UserProfileUpdateImpl>
    implements _$$UserProfileUpdateImplCopyWith<$Res> {
  __$$UserProfileUpdateImplCopyWithImpl(
    _$UserProfileUpdateImpl _value,
    $Res Function(_$UserProfileUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? consentDataStorage = freezed,
  }) {
    return _then(
      _$UserProfileUpdateImpl(
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        consentDataStorage: freezed == consentDataStorage
            ? _value.consentDataStorage
            : consentDataStorage // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileUpdateImpl implements _UserProfileUpdate {
  const _$UserProfileUpdateImpl({this.fullName, this.consentDataStorage});

  factory _$UserProfileUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileUpdateImplFromJson(json);

  @override
  final String? fullName;
  @override
  final bool? consentDataStorage;

  @override
  String toString() {
    return 'UserProfileUpdate(fullName: $fullName, consentDataStorage: $consentDataStorage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileUpdateImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.consentDataStorage, consentDataStorage) ||
                other.consentDataStorage == consentDataStorage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, consentDataStorage);

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileUpdateImplCopyWith<_$UserProfileUpdateImpl> get copyWith =>
      __$$UserProfileUpdateImplCopyWithImpl<_$UserProfileUpdateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileUpdateImplToJson(this);
  }
}

abstract class _UserProfileUpdate implements UserProfileUpdate {
  const factory _UserProfileUpdate({
    final String? fullName,
    final bool? consentDataStorage,
  }) = _$UserProfileUpdateImpl;

  factory _UserProfileUpdate.fromJson(Map<String, dynamic> json) =
      _$UserProfileUpdateImpl.fromJson;

  @override
  String? get fullName;
  @override
  bool? get consentDataStorage;

  /// Create a copy of UserProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileUpdateImplCopyWith<_$UserProfileUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
