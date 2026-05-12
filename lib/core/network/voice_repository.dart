import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_constants.dart';
import 'api_exception.dart';
import 'dio_client.dart';
import 'mock/mock_repositories.dart';

final voiceRepositoryProvider = Provider<VoiceRepository>((ref) {
  if (AppConstants.useMockBackend) {
    return MockVoiceRepository();
  }
  return VoiceRepository(ref.read(dioProvider));
});

class VoiceRepository {
  VoiceRepository(this._dio);
  final Dio _dio;

  /// Synthesize speech from text. Returns raw audio bytes (audio/mpeg).
  Future<Uint8List> synthesizeSpeech({
    required String text,
    String? voiceId,
    double? speed,
  }) async {
    try {
      final data = <String, dynamic>{'text': text};
      if (voiceId != null) data['voice_id'] = voiceId;
      if (speed != null) data['speed'] = speed;

      final response = await _dio.post(
        '/tts/synthesize',
        data: data,
        options: Options(responseType: ResponseType.bytes),
      );
      return Uint8List.fromList(response.data as List<int>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
