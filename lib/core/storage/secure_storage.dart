import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) => SecureStorage());

/// 토큰 저장소.
///
/// 모바일: flutter_secure_storage(Keychain/Keystore).
/// 웹: shared_preferences(localStorage). flutter_secure_storage_web 1.2.1이
/// 구식 dart:html/package:js 기반이라 Flutter 3.41 웹 엔진에서 WebCrypto 호출 시
/// 예외를 던지므로 웹에서는 사용하지 않는다.
class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> _write(String key, String value) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } else {
      await _storage.write(key: key, value: value);
    }
  }

  Future<String?> _read(String key) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    }
    return _storage.read(key: key);
  }

  Future<void> _delete(String key) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } else {
      await _storage.delete(key: key);
    }
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _write(AppConstants.accessTokenKey, accessToken),
      _write(AppConstants.refreshTokenKey, refreshToken),
    ]);
  }

  Future<String?> getAccessToken() => _read(AppConstants.accessTokenKey);

  Future<String?> getRefreshToken() => _read(AppConstants.refreshTokenKey);

  Future<void> saveUserId(String userId) => _write('user_id', userId);

  Future<String?> getUserId() => _read('user_id');

  Future<void> clearTokens() async {
    await Future.wait([
      _delete(AppConstants.accessTokenKey),
      _delete(AppConstants.refreshTokenKey),
      _delete('user_id'),
    ]);
  }
}
