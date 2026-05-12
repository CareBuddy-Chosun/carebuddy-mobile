class AppConstants {
  AppConstants._();

  static const String appName = 'CareBuddy';
  static const String appVersion = '0.1.0';

  // API
  static const String baseUrl = String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'http://localhost:8000',
  );
  static const String apiPrefix = '/api/v1';

  /// When true the app runs entirely offline: every repository is replaced by
  /// an in-memory mock so the UI can be exercised without a live backend.
  /// Override with `--dart-define=MOCK_BACKEND=false` to hit the real API.
  static const bool useMockBackend = bool.fromEnvironment(
    'MOCK_BACKEND',
    defaultValue: true,
  );
  static const Duration connectTimeout = Duration(seconds: 10);
  // Chat messages run extract_slots + RAG + chat LLM serially against the
  // configured LLM provider. With a local LM Studio backend each turn can take
  // 20–40s. Keep this generous so the UI doesn't time out before the server
  // commits the assistant reply.
  static const Duration receiveTimeout = Duration(seconds: 120);

  // Storage keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  // Triage results (UPPERCASE to match backend TriageLevel enum values)
  static const String triageEmergency = 'EMERGENCY';
  static const String triageVisitHospital = 'VISIT_HOSPITAL';
  static const String triageHomeCare = 'HOME_CARE';
}
