import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/hospital_models.dart';
import 'api_exception.dart';
import 'dio_client.dart';

final hospitalRepositoryProvider = Provider<HospitalRepository>((ref) {
  return HospitalRepository(ref.read(dioProvider));
});

class HospitalRepository {
  HospitalRepository(this._dio);
  final Dio _dio;

  Future<HospitalSearchResponse> searchNearby({
    required double latitude,
    required double longitude,
    String? triageLevel,
    double radiusKm = 10.0,
    int limit = 5,
  }) async {
    try {
      final params = <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        'radius_km': radiusKm,
        'limit': limit,
      };
      if (triageLevel != null) params['triage_level'] = triageLevel;

      final response = await _dio.get(
        '/hospitals/nearby',
        queryParameters: params,
      );
      return HospitalSearchResponse.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
