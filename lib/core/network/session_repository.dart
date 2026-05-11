import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/notification_models.dart';
import '../../shared/models/session_models.dart';
import 'api_exception.dart';
import 'dio_client.dart';

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepository(ref.read(dioProvider));
});

class SessionRepository {
  SessionRepository(this._dio);
  final Dio _dio;

  Future<SessionResponse> createSession({
    String? initialMessage,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (initialMessage != null) data['initial_message'] = initialMessage;
      if (latitude != null && longitude != null) {
        data['location'] = {
          'latitude': latitude,
          'longitude': longitude,
        };
      }
      final response = await _dio.post('/sessions', data: data);
      return SessionResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<SessionResponse> getSession(String sessionId) async {
    try {
      final response = await _dio.get('/sessions/$sessionId');
      return SessionResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<SessionListResponse> listSessions({
    int page = 1,
    int perPage = 20,
    String sort = 'started_at_desc',
  }) async {
    try {
      final response = await _dio.get('/sessions', queryParameters: {
        'page': page,
        'per_page': perPage,
        'sort': sort,
      });
      return SessionListResponse.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<ChatResponse> sendMessage(
    String sessionId, {
    required String content,
    String inputType = 'text',
    double? audioDurationSeconds,
  }) async {
    try {
      final data = <String, dynamic>{
        'content': content,
        'input_type': inputType,
      };
      if (audioDurationSeconds != null) {
        data['audio_duration_seconds'] = audioDurationSeconds;
      }
      final response = await _dio.post(
        '/sessions/$sessionId/messages',
        data: data,
      );
      return ChatResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> deleteSession(String sessionId) async {
    try {
      await _dio.delete('/sessions/$sessionId');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<NotificationResponse> notifyGuardians(String sessionId) async {
    try {
      final response = await _dio.post(
        '/sessions/$sessionId/notify-guardians',
      );
      return NotificationResponse.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
