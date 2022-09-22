import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_morty_cubitapp/data/base/api_constants.dart';
import 'package:rick_morty_cubitapp/data/base/base_dio_request.dart';
import 'package:rick_morty_cubitapp/domain/models/character_model/character_model.dart';

class CharactersRepository extends BaseDioApiRequest {
  String charactersUrl = '$BASE_URL/character';

  Future<List<Character>> getAllCharacters({Map<String, dynamic>? params}) async {
    Response response = await sendRequest(url: charactersUrl, queryParameters: params);
    return (response.data["results"] as List)
        .map((x) => Character.fromJson(x))
        .toList();
  }

  Future<Character> getCharacterById(int id,{Map<String, dynamic>? params}) async {
    Response response = await sendRequest(url: "$charactersUrl/$id",queryParameters: params);
    return Character.fromJson(response.data);
  }

  Future<Character> getCharacterByUrl(String url) async {
    Response response = await sendRequest(url: url);
    return Character.fromJson(response.data);
  }
}
