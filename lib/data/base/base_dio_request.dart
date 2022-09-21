import 'package:dio/dio.dart';

class BaseDioApiRequest {
  final Dio _dio = Dio();

  BaseDioApiRequest();

  Future<Response> request({
      required String url,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
      //todo
    }
  }
}
