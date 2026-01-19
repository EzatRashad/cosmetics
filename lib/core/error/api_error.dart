import 'dart:convert';
import 'package:dio/dio.dart';

class ApiError {
  final String message;

  ApiError(this.message);

  static String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout, please try again';
      case DioExceptionType.sendTimeout:
        return 'Request timeout, please try again';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond';
      case DioExceptionType.badResponse:
        final data = error.response?.data;
        if (data is Map<String, dynamic>) {
          return data['message']?.toString().isNotEmpty == true
              ? data['message']
              : 'Server error, please try again';
        } else if (data is String) {
          try {
            final decoded = Map<String, dynamic>.from(jsonDecode(data));
            return decoded['message']?.toString().isNotEmpty == true
                ? decoded['message']
                : 'Server error, please try again';
          } catch (_) {
            return data.isNotEmpty ? data : 'Server error, please try again';
          }
        } else {
          return 'Server error, please try again';
        }
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.unknown:
        return 'No internet connection';
      default:
        return 'Unexpected error occurred';
    }
  }
}
