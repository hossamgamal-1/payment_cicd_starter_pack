import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'api_error_model.dart';

class ErrorHandler implements Exception {
  late final ApiErrorModel errorModel;

  ErrorHandler.handle(dynamic error) {
    log('make payment error: $error');
    if (error is DioException) {
      errorModel = _handleError(error);
    } else if (error is StripeException) {
      errorModel = ApiErrorModel(message: error.error.message);
    } else {
      errorModel = const ApiErrorModel(code: -7, message: 'defaultError');
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  final response = error.response;
  final statusCode = response?.statusCode;
  final message = response?.statusMessage;
  final data = response?.data;

  if (statusCode != null && message != null) {
    return ApiErrorModel(code: statusCode, message: message);
  } else if (data != null) {
    return ApiErrorModel.fromJson(data);
  } else {
    return const ApiErrorModel(code: -7, message: 'defaultError');
  }
}
