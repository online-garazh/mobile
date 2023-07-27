import 'dart:developer';

import 'package:dio/dio.dart';

class ErrorHandler {
  static String errorHelper(Object e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          log('connectionTimeout');
          return e.message ?? 'error';
        case DioExceptionType.sendTimeout:
          log('sendTimeout');
          return e.message ?? 'error';
        case DioExceptionType.receiveTimeout:
          log('receiveTimeout');
          return e.message ?? 'error';
        case DioExceptionType.badResponse:
          log('badResponse');
          return e.message ?? 'error';
        case DioExceptionType.connectionError:
          log('connectionError');
          return e.message ?? 'error';
        case DioExceptionType.unknown:
          log('unknown');
          return e.message ?? 'error';
        default:
          return 'errorDefault';
      }
    } else {
      return 'unknownError';
    }
  }
}
