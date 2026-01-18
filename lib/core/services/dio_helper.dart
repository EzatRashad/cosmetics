import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  static Future<Response> getData({required String url}) async {
    try {
      final response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      throw ApiError(ApiError.handleDioError(e));
    }
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      throw ApiError(ApiError.handleDioError(e));
    }
  }
}
