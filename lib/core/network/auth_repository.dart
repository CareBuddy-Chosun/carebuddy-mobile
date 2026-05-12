import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/auth_models.dart';
import '../constants/app_constants.dart';
import 'api_exception.dart';
import 'dio_client.dart';
import 'mock/mock_repositories.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  if (AppConstants.useMockBackend) {
    return MockAuthRepository();
  }
  return AuthRepository(ref.read(dioProvider));
});

class AuthRepository {
  AuthRepository(this._dio);
  final Dio _dio;

  Future<TokenResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      return TokenResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<TokenResponse> register({
    required String email,
    required String password,
    required String fullName,
    String? dateOfBirth,
    bool consentDataStorage = false,
  }) async {
    try {
      final data = <String, dynamic>{
        'email': email,
        'password': password,
        'full_name': fullName,
        'consent_data_storage': consentDataStorage,
      };
      if (dateOfBirth != null) data['date_of_birth'] = dateOfBirth;

      final response = await _dio.post('/auth/register', data: data);
      return TokenResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<TokenResponse> refresh(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );
      return TokenResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> logout(String refreshToken) async {
    try {
      await _dio.post(
        '/auth/logout',
        data: {'refresh_token': refreshToken},
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
