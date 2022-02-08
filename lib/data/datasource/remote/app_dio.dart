import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:zmovies/constants.dart';

/// The global [Dio] singleton instance.
class AppDio with DioMixin implements Dio {
  AppDio._([BaseOptions? options]) {
    final constants = Constants.of();
    options = BaseOptions(
      baseUrl: constants.baseUrl,
      contentType: 'application/json',
      connectTimeout: constants.connectTimeout,
      sendTimeout: constants.sendTimeout,
      receiveTimeout: constants.receiveTimeout,
    );

    this.options = options;

    // Local Log
    interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
