// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return _Hospital.fromJson(json);
}

/// @nodoc
mixin _$Hospital {
  String get placeId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  bool get hasEmergencyRoom => throw _privateConstructorUsedError;
  List<String> get specialties => throw _privateConstructorUsedError;
  String? get operatingHours => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String get mapsUrl => throw _privateConstructorUsedError;

  /// Serializes this Hospital to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HospitalCopyWith<Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res, Hospital>;
  @useResult
  $Res call({
    String placeId,
    String name,
    String address,
    double distanceKm,
    String? phone,
    bool hasEmergencyRoom,
    List<String> specialties,
    String? operatingHours,
    double? latitude,
    double? longitude,
    String mapsUrl,
  });
}

/// @nodoc
class _$HospitalCopyWithImpl<$Res, $Val extends Hospital>
    implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? name = null,
    Object? address = null,
    Object? distanceKm = null,
    Object? phone = freezed,
    Object? hasEmergencyRoom = null,
    Object? specialties = null,
    Object? operatingHours = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? mapsUrl = null,
  }) {
    return _then(
      _value.copyWith(
            placeId: null == placeId
                ? _value.placeId
                : placeId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            distanceKm: null == distanceKm
                ? _value.distanceKm
                : distanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasEmergencyRoom: null == hasEmergencyRoom
                ? _value.hasEmergencyRoom
                : hasEmergencyRoom // ignore: cast_nullable_to_non_nullable
                      as bool,
            specialties: null == specialties
                ? _value.specialties
                : specialties // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            operatingHours: freezed == operatingHours
                ? _value.operatingHours
                : operatingHours // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            mapsUrl: null == mapsUrl
                ? _value.mapsUrl
                : mapsUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HospitalImplCopyWith<$Res>
    implements $HospitalCopyWith<$Res> {
  factory _$$HospitalImplCopyWith(
    _$HospitalImpl value,
    $Res Function(_$HospitalImpl) then,
  ) = __$$HospitalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String placeId,
    String name,
    String address,
    double distanceKm,
    String? phone,
    bool hasEmergencyRoom,
    List<String> specialties,
    String? operatingHours,
    double? latitude,
    double? longitude,
    String mapsUrl,
  });
}

/// @nodoc
class __$$HospitalImplCopyWithImpl<$Res>
    extends _$HospitalCopyWithImpl<$Res, _$HospitalImpl>
    implements _$$HospitalImplCopyWith<$Res> {
  __$$HospitalImplCopyWithImpl(
    _$HospitalImpl _value,
    $Res Function(_$HospitalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? name = null,
    Object? address = null,
    Object? distanceKm = null,
    Object? phone = freezed,
    Object? hasEmergencyRoom = null,
    Object? specialties = null,
    Object? operatingHours = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? mapsUrl = null,
  }) {
    return _then(
      _$HospitalImpl(
        placeId: null == placeId
            ? _value.placeId
            : placeId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasEmergencyRoom: null == hasEmergencyRoom
            ? _value.hasEmergencyRoom
            : hasEmergencyRoom // ignore: cast_nullable_to_non_nullable
                  as bool,
        specialties: null == specialties
            ? _value._specialties
            : specialties // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        operatingHours: freezed == operatingHours
            ? _value.operatingHours
            : operatingHours // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        mapsUrl: null == mapsUrl
            ? _value.mapsUrl
            : mapsUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HospitalImpl implements _Hospital {
  const _$HospitalImpl({
    required this.placeId,
    required this.name,
    required this.address,
    required this.distanceKm,
    this.phone,
    this.hasEmergencyRoom = false,
    final List<String> specialties = const [],
    this.operatingHours,
    this.latitude,
    this.longitude,
    this.mapsUrl = '',
  }) : _specialties = specialties;

  factory _$HospitalImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalImplFromJson(json);

  @override
  final String placeId;
  @override
  final String name;
  @override
  final String address;
  @override
  final double distanceKm;
  @override
  final String? phone;
  @override
  @JsonKey()
  final bool hasEmergencyRoom;
  final List<String> _specialties;
  @override
  @JsonKey()
  List<String> get specialties {
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialties);
  }

  @override
  final String? operatingHours;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey()
  final String mapsUrl;

  @override
  String toString() {
    return 'Hospital(placeId: $placeId, name: $name, address: $address, distanceKm: $distanceKm, phone: $phone, hasEmergencyRoom: $hasEmergencyRoom, specialties: $specialties, operatingHours: $operatingHours, latitude: $latitude, longitude: $longitude, mapsUrl: $mapsUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.hasEmergencyRoom, hasEmergencyRoom) ||
                other.hasEmergencyRoom == hasEmergencyRoom) &&
            const DeepCollectionEquality().equals(
              other._specialties,
              _specialties,
            ) &&
            (identical(other.operatingHours, operatingHours) ||
                other.operatingHours == operatingHours) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.mapsUrl, mapsUrl) || other.mapsUrl == mapsUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    placeId,
    name,
    address,
    distanceKm,
    phone,
    hasEmergencyRoom,
    const DeepCollectionEquality().hash(_specialties),
    operatingHours,
    latitude,
    longitude,
    mapsUrl,
  );

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      __$$HospitalImplCopyWithImpl<_$HospitalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalImplToJson(this);
  }
}

abstract class _Hospital implements Hospital {
  const factory _Hospital({
    required final String placeId,
    required final String name,
    required final String address,
    required final double distanceKm,
    final String? phone,
    final bool hasEmergencyRoom,
    final List<String> specialties,
    final String? operatingHours,
    final double? latitude,
    final double? longitude,
    final String mapsUrl,
  }) = _$HospitalImpl;

  factory _Hospital.fromJson(Map<String, dynamic> json) =
      _$HospitalImpl.fromJson;

  @override
  String get placeId;
  @override
  String get name;
  @override
  String get address;
  @override
  double get distanceKm;
  @override
  String? get phone;
  @override
  bool get hasEmergencyRoom;
  @override
  List<String> get specialties;
  @override
  String? get operatingHours;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String get mapsUrl;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return _UserLocation.fromJson(json);
}

/// @nodoc
mixin _$UserLocation {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this UserLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserLocationCopyWith<UserLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationCopyWith<$Res> {
  factory $UserLocationCopyWith(
    UserLocation value,
    $Res Function(UserLocation) then,
  ) = _$UserLocationCopyWithImpl<$Res, UserLocation>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$UserLocationCopyWithImpl<$Res, $Val extends UserLocation>
    implements $UserLocationCopyWith<$Res> {
  _$UserLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _value.copyWith(
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserLocationImplCopyWith<$Res>
    implements $UserLocationCopyWith<$Res> {
  factory _$$UserLocationImplCopyWith(
    _$UserLocationImpl value,
    $Res Function(_$UserLocationImpl) then,
  ) = __$$UserLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$UserLocationImplCopyWithImpl<$Res>
    extends _$UserLocationCopyWithImpl<$Res, _$UserLocationImpl>
    implements _$$UserLocationImplCopyWith<$Res> {
  __$$UserLocationImplCopyWithImpl(
    _$UserLocationImpl _value,
    $Res Function(_$UserLocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _$UserLocationImpl(
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLocationImpl implements _UserLocation {
  const _$UserLocationImpl({required this.latitude, required this.longitude});

  factory _$UserLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLocationImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'UserLocation(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of UserLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLocationImplCopyWith<_$UserLocationImpl> get copyWith =>
      __$$UserLocationImplCopyWithImpl<_$UserLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLocationImplToJson(this);
  }
}

abstract class _UserLocation implements UserLocation {
  const factory _UserLocation({
    required final double latitude,
    required final double longitude,
  }) = _$UserLocationImpl;

  factory _UserLocation.fromJson(Map<String, dynamic> json) =
      _$UserLocationImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of UserLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLocationImplCopyWith<_$UserLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HospitalSearchResponse _$HospitalSearchResponseFromJson(
  Map<String, dynamic> json,
) {
  return _HospitalSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$HospitalSearchResponse {
  List<Hospital> get hospitals => throw _privateConstructorUsedError;
  double get searchRadiusKm => throw _privateConstructorUsedError;
  UserLocation get userLocation => throw _privateConstructorUsedError;

  /// Serializes this HospitalSearchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HospitalSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HospitalSearchResponseCopyWith<HospitalSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalSearchResponseCopyWith<$Res> {
  factory $HospitalSearchResponseCopyWith(
    HospitalSearchResponse value,
    $Res Function(HospitalSearchResponse) then,
  ) = _$HospitalSearchResponseCopyWithImpl<$Res, HospitalSearchResponse>;
  @useResult
  $Res call({
    List<Hospital> hospitals,
    double searchRadiusKm,
    UserLocation userLocation,
  });

  $UserLocationCopyWith<$Res> get userLocation;
}

/// @nodoc
class _$HospitalSearchResponseCopyWithImpl<
  $Res,
  $Val extends HospitalSearchResponse
>
    implements $HospitalSearchResponseCopyWith<$Res> {
  _$HospitalSearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HospitalSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
    Object? searchRadiusKm = null,
    Object? userLocation = null,
  }) {
    return _then(
      _value.copyWith(
            hospitals: null == hospitals
                ? _value.hospitals
                : hospitals // ignore: cast_nullable_to_non_nullable
                      as List<Hospital>,
            searchRadiusKm: null == searchRadiusKm
                ? _value.searchRadiusKm
                : searchRadiusKm // ignore: cast_nullable_to_non_nullable
                      as double,
            userLocation: null == userLocation
                ? _value.userLocation
                : userLocation // ignore: cast_nullable_to_non_nullable
                      as UserLocation,
          )
          as $Val,
    );
  }

  /// Create a copy of HospitalSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserLocationCopyWith<$Res> get userLocation {
    return $UserLocationCopyWith<$Res>(_value.userLocation, (value) {
      return _then(_value.copyWith(userLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HospitalSearchResponseImplCopyWith<$Res>
    implements $HospitalSearchResponseCopyWith<$Res> {
  factory _$$HospitalSearchResponseImplCopyWith(
    _$HospitalSearchResponseImpl value,
    $Res Function(_$HospitalSearchResponseImpl) then,
  ) = __$$HospitalSearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Hospital> hospitals,
    double searchRadiusKm,
    UserLocation userLocation,
  });

  @override
  $UserLocationCopyWith<$Res> get userLocation;
}

/// @nodoc
class __$$HospitalSearchResponseImplCopyWithImpl<$Res>
    extends
        _$HospitalSearchResponseCopyWithImpl<$Res, _$HospitalSearchResponseImpl>
    implements _$$HospitalSearchResponseImplCopyWith<$Res> {
  __$$HospitalSearchResponseImplCopyWithImpl(
    _$HospitalSearchResponseImpl _value,
    $Res Function(_$HospitalSearchResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HospitalSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
    Object? searchRadiusKm = null,
    Object? userLocation = null,
  }) {
    return _then(
      _$HospitalSearchResponseImpl(
        hospitals: null == hospitals
            ? _value._hospitals
            : hospitals // ignore: cast_nullable_to_non_nullable
                  as List<Hospital>,
        searchRadiusKm: null == searchRadiusKm
            ? _value.searchRadiusKm
            : searchRadiusKm // ignore: cast_nullable_to_non_nullable
                  as double,
        userLocation: null == userLocation
            ? _value.userLocation
            : userLocation // ignore: cast_nullable_to_non_nullable
                  as UserLocation,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HospitalSearchResponseImpl implements _HospitalSearchResponse {
  const _$HospitalSearchResponseImpl({
    required final List<Hospital> hospitals,
    required this.searchRadiusKm,
    required this.userLocation,
  }) : _hospitals = hospitals;

  factory _$HospitalSearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalSearchResponseImplFromJson(json);

  final List<Hospital> _hospitals;
  @override
  List<Hospital> get hospitals {
    if (_hospitals is EqualUnmodifiableListView) return _hospitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
  }

  @override
  final double searchRadiusKm;
  @override
  final UserLocation userLocation;

  @override
  String toString() {
    return 'HospitalSearchResponse(hospitals: $hospitals, searchRadiusKm: $searchRadiusKm, userLocation: $userLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalSearchResponseImpl &&
            const DeepCollectionEquality().equals(
              other._hospitals,
              _hospitals,
            ) &&
            (identical(other.searchRadiusKm, searchRadiusKm) ||
                other.searchRadiusKm == searchRadiusKm) &&
            (identical(other.userLocation, userLocation) ||
                other.userLocation == userLocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_hospitals),
    searchRadiusKm,
    userLocation,
  );

  /// Create a copy of HospitalSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalSearchResponseImplCopyWith<_$HospitalSearchResponseImpl>
  get copyWith =>
      __$$HospitalSearchResponseImplCopyWithImpl<_$HospitalSearchResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalSearchResponseImplToJson(this);
  }
}

abstract class _HospitalSearchResponse implements HospitalSearchResponse {
  const factory _HospitalSearchResponse({
    required final List<Hospital> hospitals,
    required final double searchRadiusKm,
    required final UserLocation userLocation,
  }) = _$HospitalSearchResponseImpl;

  factory _HospitalSearchResponse.fromJson(Map<String, dynamic> json) =
      _$HospitalSearchResponseImpl.fromJson;

  @override
  List<Hospital> get hospitals;
  @override
  double get searchRadiusKm;
  @override
  UserLocation get userLocation;

  /// Create a copy of HospitalSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalSearchResponseImplCopyWith<_$HospitalSearchResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
