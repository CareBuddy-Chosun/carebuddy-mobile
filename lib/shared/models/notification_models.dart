import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_models.freezed.dart';
part 'notification_models.g.dart';

@freezed
class GuardianNotification with _$GuardianNotification {
  const factory GuardianNotification({
    required String guardianName,
    required String phone,
    required String status,
  }) = _GuardianNotification;

  factory GuardianNotification.fromJson(Map<String, dynamic> json) =>
      _$GuardianNotificationFromJson(json);
}

@freezed
class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    required List<GuardianNotification> notifications,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
