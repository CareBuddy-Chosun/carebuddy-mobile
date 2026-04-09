import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/secure_storage.dart';

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier(this._ref) : super(false);

  final Ref _ref;

  Future<void> login(String email, String password) async {
    final dio = _ref.read(dioProvider);
    final storage = _ref.read(secureStorageProvider);

    final response = await dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    await storage.saveTokens(
      accessToken: response.data['access_token'],
      refreshToken: response.data['refresh_token'],
    );
    state = true;
  }

  Future<void> register(String email, String password, String fullName) async {
    final dio = _ref.read(dioProvider);
    final storage = _ref.read(secureStorageProvider);

    final response = await dio.post('/auth/register', data: {
      'email': email,
      'password': password,
      'full_name': fullName,
    });

    await storage.saveTokens(
      accessToken: response.data['access_token'],
      refreshToken: response.data['refresh_token'],
    );
    state = true;
  }

  Future<void> logout() async {
    final storage = _ref.read(secureStorageProvider);
    await storage.clearTokens();
    state = false;
  }
}
