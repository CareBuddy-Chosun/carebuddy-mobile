import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/auth_repository.dart';
import '../../../../core/storage/secure_storage.dart';

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier(this._ref) : super(false);

  final Ref _ref;

  Future<void> login(String email, String password) async {
    final repo = _ref.read(authRepositoryProvider);
    final storage = _ref.read(secureStorageProvider);

    final response = await repo.login(email: email, password: password);
    await storage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
    if (response.userId != null) {
      await storage.saveUserId(response.userId!);
    }
    state = true;
  }

  Future<void> register(
    String email,
    String password,
    String fullName, {
    String? dateOfBirth,
    bool consentDataStorage = false,
  }) async {
    final repo = _ref.read(authRepositoryProvider);
    final storage = _ref.read(secureStorageProvider);

    final response = await repo.register(
      email: email,
      password: password,
      fullName: fullName,
      dateOfBirth: dateOfBirth,
      consentDataStorage: consentDataStorage,
    );
    await storage.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
    if (response.userId != null) {
      await storage.saveUserId(response.userId!);
    }
    state = true;
  }

  Future<void> logout() async {
    final repo = _ref.read(authRepositoryProvider);
    final storage = _ref.read(secureStorageProvider);

    // Call server logout (best-effort)
    try {
      final refreshToken = await storage.getRefreshToken();
      if (refreshToken != null) {
        await repo.logout(refreshToken);
      }
    } catch (_) {
      // Ignore server errors — still clear local state
    }

    await storage.clearTokens();
    state = false;
  }

  Future<void> checkAuthStatus() async {
    final storage = _ref.read(secureStorageProvider);
    final token = await storage.getAccessToken();
    state = token != null;
  }
}
