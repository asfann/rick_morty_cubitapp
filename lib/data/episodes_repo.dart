import 'package:dio/dio.dart';
import 'package:rick_morty_cubitapp/data/base/base_dio_request.dart';
import 'package:rick_morty_cubitapp/domain/models/episode_model/episode_model.dart';

import 'base/api_constants.dart';

class EpisodesRepo extends BaseDioApiRequest {
  String episodesUrl = '$BASE_URL/episode';

  Future<List<Episode>> getAllEpisodes({Map<String, dynamic>? params}) async {
    Response response = await sendRequest(url: episodesUrl,queryParameters: params);
    return (response.data["results"] as List)
        .map((x) => Episode.fromJson(x))
        .toList();
  }

  Future<Episode> getEpisodeById(int id,{Map<String, dynamic>? params}) async {
    Response response = await sendRequest(url: "$episodesUrl/$id",queryParameters: params);
    return Episode.fromJson(response.data);
  }
}
