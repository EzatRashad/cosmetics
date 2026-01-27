import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/view_model/auth/auth_cubit.dart';
import 'package:dio/dio.dart';

final AuthCubit authCubit = AuthCubit();

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

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (token != null && token!.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            authCubit.logout();
          }
          handler.next(error);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw ApiError(ApiError.handleDioError(e));
    }
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ApiError(ApiError.handleDioError(e));
    }
  }

  static Future<Response> remove({required String url}) async {
    try {
      final response = await dio.delete(url);
      return response;
    } on DioException catch (e) {
      throw ApiError(ApiError.handleDioError(e));
    }
  }

  static Future<Response> put({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ApiError(ApiError.handleDioError(e));
    }
  }
}

enum AppStatus { initial, loading, success, error }
