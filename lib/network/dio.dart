import 'package:dio/dio.dart';

import 'networkUtils.dart';

Dio createDio() {
  final dio = Dio();
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
      bool isConnected = await NetworkUtils.isNetworkAvailable();
      if (!isConnected) {
        handler.reject(
          DioException(
            requestOptions: options,
            error: 'No internet connection',
            type: DioExceptionType.unknown,
          ),
        );
      } else {
        handler.next(options);
      }
    },
  ));


  // Add logging interceptor
  dio.interceptors.add(LogInterceptor(
    request: false,
    requestHeader: false,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
    error: true,
    logPrint: print,
  ));

  return dio;
}