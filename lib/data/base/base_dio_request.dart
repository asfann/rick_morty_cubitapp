import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_morty_cubitapp/data/base/requeest_exception.dart';

class BaseDioApiRequest {
  final Dio _dio = Dio();

  BaseDioApiRequest();

  Future<Response> sendRequest(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      print(queryParameters);
      Response response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      if(e.response?.statusCode != null && e.response!.statusCode! >= 400){
        switch(e.response!.statusCode){
          case 400:
            throw RequestException(code: RequestExceptionCode.BadRequest);
          case 404:
            throw RequestException(code: RequestExceptionCode.NotFound);
        }
      }
      throw RequestException(code: RequestExceptionCode.Unknown);
    } catch(e){
      throw RequestException(code: RequestExceptionCode.NoInternet);
    }
  }
}
