// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HospitalImpl _$$HospitalImplFromJson(Map<String, dynamic> json) =>
    _$HospitalImpl(
      placeId: json['place_id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      distanceKm: (json['distance_km'] as num).toDouble(),
      phone: json['phone'] as String?,
      hasEmergencyRoom: json['has_emergency_room'] as bool? ?? false,
      specialties:
          (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      operatingHours: json['operating_hours'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      mapsUrl: json['maps_url'] as String? ?? '',
    );

Map<String, dynamic> _$$HospitalImplToJson(_$HospitalImpl instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'name': instance.name,
      'address': instance.address,
      'distance_km': instance.distanceKm,
      'phone': instance.phone,
      'has_emergency_room': instance.hasEmergencyRoom,
      'specialties': instance.specialties,
      'operating_hours': instance.operatingHours,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'maps_url': instance.mapsUrl,
    };

_$UserLocationImpl _$$UserLocationImplFromJson(Map<String, dynamic> json) =>
    _$UserLocationImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserLocationImplToJson(_$UserLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$HospitalSearchResponseImpl _$$HospitalSearchResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HospitalSearchResponseImpl(
  hospitals: (json['hospitals'] as List<dynamic>)
      .map((e) => Hospital.fromJson(e as Map<String, dynamic>))
      .toList(),
  searchRadiusKm: (json['search_radius_km'] as num).toDouble(),
  userLocation: UserLocation.fromJson(
    json['user_location'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$HospitalSearchResponseImplToJson(
  _$HospitalSearchResponseImpl instance,
) => <String, dynamic>{
  'hospitals': instance.hospitals.map((e) => e.toJson()).toList(),
  'search_radius_km': instance.searchRadiusKm,
  'user_location': instance.userLocation.toJson(),
};
