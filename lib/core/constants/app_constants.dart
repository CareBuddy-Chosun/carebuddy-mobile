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
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  // Triage results (UPPERCASE to match backend TriageLevel enum values)
  static const String triageEmergency = 'EMERGENCY';
  static const String triageVisitHospital = 'VISIT_HOSPITAL';
  static const String triageHomeCare = 'HOME_CARE';
}
