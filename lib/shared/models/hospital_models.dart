import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_models.freezed.dart';
part 'hospital_models.g.dart';

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    required String placeId,
    required String name,
    required String address,
    required double distanceKm,
    String? phone,
    @Default(false) bool hasEmergencyRoom,
    @Default([]) List<String> specialties,
    String? operatingHours,
    double? latitude,
    double? longitude,
    @Default('') String mapsUrl,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
}

@freezed
class UserLocation with _$UserLocation {
  const factory UserLocation({
    required double latitude,
    required double longitude,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);
}

@freezed
class HospitalSearchResponse with _$HospitalSearchResponse {
  const factory HospitalSearchResponse({
    required List<Hospital> hospitals,
    required double searchRadiusKm,
    required UserLocation userLocation,
  }) = _HospitalSearchResponse;

  factory HospitalSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$HospitalSearchResponseFromJson(json);
}
