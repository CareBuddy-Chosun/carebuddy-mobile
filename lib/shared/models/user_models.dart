import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class Guardian with _$Guardian {
  const factory Guardian({
    required String id,
    required String name,
    required String phone,
    String? relationship,
  }) = _Guardian;

  factory Guardian.fromJson(Map<String, dynamic> json) =>
      _$GuardianFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String userId,
    required String email,
    required String fullName,
    String? dateOfBirth,
    @Default(false) bool consentDataStorage,
    @Default([]) List<Guardian> guardians,
    required String createdAt,
    @Default(0) int sessionCount,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class GuardianCreate with _$GuardianCreate {
  const factory GuardianCreate({
    required String name,
    required String phone,
    String? relationship,
  }) = _GuardianCreate;

  factory GuardianCreate.fromJson(Map<String, dynamic> json) =>
      _$GuardianCreateFromJson(json);
}

@freezed
class UserProfileUpdate with _$UserProfileUpdate {
  const factory UserProfileUpdate({
    String? fullName,
    bool? consentDataStorage,
  }) = _UserProfileUpdate;

  factory UserProfileUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserProfileUpdateFromJson(json);
}
