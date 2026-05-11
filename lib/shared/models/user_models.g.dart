// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuardianImpl _$$GuardianImplFromJson(Map<String, dynamic> json) =>
    _$GuardianImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      relationship: json['relationship'] as String?,
    );

Map<String, dynamic> _$$GuardianImplToJson(_$GuardianImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'relationship': instance.relationship,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      userId: json['user_id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      dateOfBirth: json['date_of_birth'] as String?,
      consentDataStorage: json['consent_data_storage'] as bool? ?? false,
      guardians:
          (json['guardians'] as List<dynamic>?)
              ?.map((e) => Guardian.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['created_at'] as String,
      sessionCount: (json['session_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'full_name': instance.fullName,
      'date_of_birth': instance.dateOfBirth,
      'consent_data_storage': instance.consentDataStorage,
      'guardians': instance.guardians.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'session_count': instance.sessionCount,
    };

_$GuardianCreateImpl _$$GuardianCreateImplFromJson(Map<String, dynamic> json) =>
    _$GuardianCreateImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      relationship: json['relationship'] as String?,
    );

Map<String, dynamic> _$$GuardianCreateImplToJson(
  _$GuardianCreateImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'relationship': instance.relationship,
};

_$UserProfileUpdateImpl _$$UserProfileUpdateImplFromJson(
  Map<String, dynamic> json,
) => _$UserProfileUpdateImpl(
  fullName: json['full_name'] as String?,
  consentDataStorage: json['consent_data_storage'] as bool?,
);

Map<String, dynamic> _$$UserProfileUpdateImplToJson(
  _$UserProfileUpdateImpl instance,
) => <String, dynamic>{
  'full_name': instance.fullName,
  'consent_data_storage': instance.consentDataStorage,
};
