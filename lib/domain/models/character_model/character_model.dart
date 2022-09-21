import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_morty_cubitapp/domain/models/location/location_model.dart';

import '../origin_model/origin_model.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';
@Freezed()
class Character with _$Character{
  const factory Character({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required Origin origin,
    required Location location,
    required String image,
    required List<String> episode,
    required String url,
    required String created
  }) = _Character;



  factory Character.fromJson(Map<String, Object?> json)
  => _$CharacterFromJson(json);
}