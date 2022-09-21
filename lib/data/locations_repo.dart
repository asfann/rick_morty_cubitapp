import 'package:dio/dio.dart';
import 'package:rick_morty_cubitapp/data/base/base_dio_request.dart';

import '../domain/models/location/location_model.dart';
import 'base/api_constants.dart';

class LocationRepo extends BaseDioApiRequest{
  String locationsUrl = '$BASE_URL/location';

  Future<List<Location>> getAllLocations({Map<String, dynamic>? params}) async {
    Response response = await sendRequest(url: locationsUrl,queryParameters: params);
    return (response.data["results"] as List)
        .map((x) => Location.fromJson(x))
        .toList();
  }

  Future<Location> getLocationById(int id,{Map<String, dynamic>? params}) async {
    Response response = await sendRequest(url: "$locationsUrl/$id",queryParameters: params);
    return Location.fromJson(response.data);
  }
}