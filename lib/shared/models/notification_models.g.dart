// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuardianNotificationImpl _$$GuardianNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$GuardianNotificationImpl(
  guardianName: json['guardian_name'] as String,
  phone: json['phone'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$$GuardianNotificationImplToJson(
  _$GuardianNotificationImpl instance,
) => <String, dynamic>{
  'guardian_name': instance.guardianName,
  'phone': instance.phone,
  'status': instance.status,
};

_$NotificationResponseImpl _$$NotificationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationResponseImpl(
  notifications: (json['notifications'] as List<dynamic>)
      .map((e) => GuardianNotification.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$NotificationResponseImplToJson(
  _$NotificationResponseImpl instance,
) => <String, dynamic>{
  'notifications': instance.notifications.map((e) => e.toJson()).toList(),
};
