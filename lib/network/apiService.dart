import 'package:dio/dio.dart';

import 'apiConstants.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = ApiConstants.baseUrl;
  // Constructor
  ApiService(this.dio);

  // Common method for making GET requests
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get('$baseUrl$path', queryParameters: queryParameters, options: Options());
    return response;
  }

  // Common method for making POST requests
  Future<Response> post(String path, dynamic data, {String? token}) async {
    final response = await dio.post('$baseUrl$path', data: data, options: Options());
    return response;
  }
}
