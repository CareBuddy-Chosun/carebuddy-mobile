import 'package:dio/dio.dart';

enum ApiErrorType {
  unauthorized,
  notFound,
  conflict,
  validation,
  unsupportedMedia,
  serverError,
  networkError,
  unknown,
}

class ApiException implements Exception {
  ApiException({
    required this.message,
    required this.type,
    this.statusCode,
  });

  factory ApiException.fromDioException(DioException e) {
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    String message;
    if (data is Map<String, dynamic> && data.containsKey('detail')) {
      final detail = data['detail'];
      if (detail is String) {
        message = detail;
      } else if (detail is List && detail.isNotEmpty) {
        message = detail.map((d) => d['msg'] ?? d.toString()).join(', ');
      } else {
        message = detail.toString();
      }
    } else {
      message = e.message ?? 'An unexpected error occurred';
    }

    ApiErrorType type;
    switch (statusCode) {
      case 400:
        type = ApiErrorType.validation;
      case 401:
        type = ApiErrorType.unauthorized;
      case 404:
        type = ApiErrorType.notFound;
      case 409:
        type = ApiErrorType.conflict;
      case 415:
        type = ApiErrorType.unsupportedMedia;
      case 422:
        type = ApiErrorType.validation;
      default:
        if (statusCode != null && statusCode >= 500) {
          type = ApiErrorType.serverError;
        } else if (e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.connectionTimeout) {
          type = ApiErrorType.networkError;
        } else {
          type = ApiErrorType.unknown;
        }
    }

    return ApiException(
      message: message,
      type: type,
      statusCode: statusCode,
    );
  }

  final String message;
  final ApiErrorType type;
  final int? statusCode;

  String get userMessage => switch (type) {
        ApiErrorType.unauthorized => 'Please log in again.',
        ApiErrorType.notFound => 'The requested resource was not found.',
        ApiErrorType.conflict => message,
        ApiErrorType.validation => message,
        ApiErrorType.unsupportedMedia => 'Unsupported file format.',
        ApiErrorType.serverError => 'Server error. Please try again later.',
        ApiErrorType.networkError =>
          'Network error. Please check your connection.',
        ApiErrorType.unknown => message,
      };

  @override
  String toString() => 'ApiException($type, $statusCode): $message';
}
