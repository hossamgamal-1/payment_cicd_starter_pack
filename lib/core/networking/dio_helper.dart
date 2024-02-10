import 'package:dio/dio.dart';

class DioHelper {
  const DioHelper._();

  static Dio? _dio;

  static Dio get instance {
    _dio ??= Dio()
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );

    return _dio!;
  }
}
