import 'package:dio/dio.dart';
import 'package:rick_morty_cubitapp/data/base/api_constants.dart';
import 'package:rick_morty_cubitapp/data/base/base_dio_request.dart';

class CharactersRepository extends BaseDioApiRequest{
  var charactersUrl = '$BASE_URL/character';

   void  getAllCharacters() async {
      Response response = await request(url: charactersUrl);

  }

  void getCharacterById(int id) async {
    Response response = await request(url: "$charactersUrl/$id");
  }

}