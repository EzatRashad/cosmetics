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
        return error.response?.data['message'] ??
            'Server error, please try again';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.unknown:
        return 'No internet connection';
      default:
        return 'Unexpected error occurred';
    }
  }
}
