import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_constants.dart';
import '../storage/secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.read(secureStorageProvider);
  return _buildDio(storage);
});

Dio _buildDio(SecureStorage storage) {
  final dio = Dio(
    BaseOptions(
      baseUrl: '${AppConstants.baseUrl}${AppConstants.apiPrefix}',
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(_AuthInterceptor(storage, dio));
  return dio;
}

class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._storage, this._dio);

  final SecureStorage _storage;
  final Dio _dio;

  // Mutex to prevent concurrent refresh requests
  Completer<TokenPair?>? _refreshCompleter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final tokenPair = await _refreshTokenSafe();
      if (tokenPair != null) {
        err.requestOptions.headers['Authorization'] =
            'Bearer ${tokenPair.accessToken}';
        try {
          final retried = await _dio.fetch(err.requestOptions);
          return handler.resolve(retried);
        } catch (_) {
          // Retry failed, fall through to handler.next(err)
        }
      }
    }
    handler.next(err);
  }

  /// Ensures only one refresh request runs at a time.
  /// Concurrent 401 errors will wait for the same refresh result.
  Future<TokenPair?> _refreshTokenSafe() async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<TokenPair?>();

    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) {
        _refreshCompleter!.complete(null);
        return null;
      }

      final response = await _dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );
      final newAccess = response.data['access_token'] as String;
      final newRefresh = response.data['refresh_token'] as String;
      await _storage.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
      );

      final pair = TokenPair(newAccess, newRefresh);
      _refreshCompleter!.complete(pair);
      return pair;
    } catch (_) {
      await _storage.clearTokens();
      _refreshCompleter!.complete(null);
      return null;
    } finally {
      _refreshCompleter = null;
    }
  }
}

class TokenPair {
  const TokenPair(this.accessToken, this.refreshToken);
  final String accessToken;
  final String refreshToken;
}
