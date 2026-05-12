import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/user_models.dart';
import '../constants/app_constants.dart';
import 'api_exception.dart';
import 'dio_client.dart';
import 'mock/mock_repositories.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  if (AppConstants.useMockBackend) {
    return MockUserRepository();
  }
  return UserRepository(ref.read(dioProvider));
});

class UserRepository {
  UserRepository(this._dio);
  final Dio _dio;

  Future<UserProfile> getProfile() async {
    try {
      final response = await _dio.get('/users/me');
      return UserProfile.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<UserProfile> updateProfile(UserProfileUpdate update) async {
    try {
      final data = <String, dynamic>{};
      if (update.fullName != null) data['full_name'] = update.fullName;
      if (update.consentDataStorage != null) {
        data['consent_data_storage'] = update.consentDataStorage;
      }
      final response = await _dio.patch('/users/me', data: data);
      return UserProfile.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> deleteAccount(String password) async {
    try {
      await _dio.delete('/users/me', data: {'password': password});
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  // Guardian CRUD

  Future<Guardian> addGuardian(GuardianCreate guardian) async {
    try {
      final response = await _dio.post(
        '/users/me/guardians',
        data: guardian.toJson(),
      );
      return Guardian.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Guardian> updateGuardian(String id, GuardianCreate guardian) async {
    try {
      final response = await _dio.patch(
        '/users/me/guardians/$id',
        data: guardian.toJson(),
      );
      return Guardian.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> deleteGuardian(String id) async {
    try {
      await _dio.delete('/users/me/guardians/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
