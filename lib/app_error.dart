import 'dart:io';

import 'package:dio/dio.dart';

/// Error Type
enum AppErrorType {
  apiKeyNotSet,
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

/// Error.
class AppError {
  late String message;
  late AppErrorType type;
  DioError? dioError;

  AppError.direct(AppErrorType errorType, String errorMessage)
      : type = errorType,
        message = errorMessage;
  AppError.dio(DioError error) {
    message = error.message;
    dioError = error;
    switch (error.type) {
      case DioErrorType.other:
        if (error.error is SocketException) {
          type = AppErrorType.network;
        } else {
          type = AppErrorType.unknown;
        }
        break;
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
        type = AppErrorType.timeout;
        break;
      case DioErrorType.sendTimeout:
        type = AppErrorType.network;
        break;
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case HttpStatus.badRequest: // 400
            type = AppErrorType.badRequest;
            break;
          case HttpStatus.unauthorized: // 401
            type = AppErrorType.unauthorized;
            break;
          case HttpStatus.internalServerError: // 500
          case HttpStatus.badGateway: // 502
          case HttpStatus.serviceUnavailable: // 503
          case HttpStatus.gatewayTimeout: // 504
            type = AppErrorType.server;
            break;
          default:
            type = AppErrorType.unknown;
            break;
        }
        break;
      case DioErrorType.cancel:
        type = AppErrorType.cancel;
        break;
      default:
        type = AppErrorType.unknown;
        break;
    }
  }
}
