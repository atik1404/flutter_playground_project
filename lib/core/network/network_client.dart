import 'package:dio/dio.dart';
import 'package:playground_flutter_project/common/logger/app_logger.dart';
import 'package:playground_flutter_project/core/network/handle_api_call.dart';

import 'package:playground_flutter_project/core/network/result.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_pref_key.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_prefs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A network client wrapper around [Dio] that handles API requests and error handling.
///
/// This class provides methods for performing common HTTP operations (GET, POST, PUT, DELETE, PATCH)
/// and automatically handles network exceptions, returning a [Result] object.
final class NetworkClient {
  final Dio _dio;

  /// Creates a new instance of [NetworkClient].
  ///
  /// [baseUrl] is the base URL for the API.
  /// [sharedPrefs] is used to retrieve the access token for authorization headers.
  factory NetworkClient({
    required String baseUrl,
    required SharedPrefs sharedPrefs,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 20),
        contentType: 'application/json',
      ),
    );

    AppLogger.log(
      "accessToken: ${sharedPrefs.getString(key: SharedPrefKey.accessToken)}",
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final accessToken = sharedPrefs.getString(
            key: SharedPrefKey.accessToken,
          );
          if (accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true),
    );

    return NetworkClient._internal(dio);
  }

  NetworkClient._internal(this._dio);

  /// Performs a GET request.
  ///
  /// [path] is the API endpoint path.
  /// [queryParameters] are optional query parameters.
  /// [parseJson] is a function to parse the response JSON into a model [T].
  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parseJson,
  }) {
    return handleApiResponse(
      () => _dio.get(path, queryParameters: queryParameters),
      parseJson,
    );
  }

  /// Performs a POST request.
  ///
  /// [path] is the API endpoint path.
  /// [data] is the request body.
  /// [queryParameters] are optional query parameters.
  /// [parseJson] is a function to parse the response JSON into a model [T].
  Future<Result<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parseJson,
  }) {
    return handleApiResponse(
      () => _dio.post(path, data: data, queryParameters: queryParameters),
      parseJson,
    );
  }

  /// Performs a PUT request.
  ///
  /// [path] is the API endpoint path.
  /// [data] is the request body.
  /// [queryParameters] are optional query parameters.
  /// [parseJson] is a function to parse the response JSON into a model [T].
  Future<Result<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parseJson,
  }) {
    return handleApiResponse(
      () => _dio.put(path, data: data, queryParameters: queryParameters),
      parseJson,
    );
  }

  /// Performs a DELETE request.
  ///
  /// [path] is the API endpoint path.
  /// [data] is the request body.
  /// [queryParameters] are optional query parameters.
  /// [parseJson] is a function to parse the response JSON into a model [T].
  Future<Result<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parseJson,
  }) {
    return handleApiResponse(
      () => _dio.delete(path, data: data, queryParameters: queryParameters),
      parseJson,
    );
  }

  /// Performs a PATCH request.
  ///
  /// [path] is the API endpoint path.
  /// [data] is the request body.
  /// [queryParameters] are optional query parameters.
  /// [parseJson] is a function to parse the response JSON into a model [T].
  Future<Result<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parseJson,
  }) {
    return handleApiResponse(
      () => _dio.patch(path, data: data, queryParameters: queryParameters),
      parseJson,
    );
  }
}
