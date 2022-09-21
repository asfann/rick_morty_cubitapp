import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_morty_cubitapp/domain/models/location/location_model.dart';

import '../origin_model/origin_model.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';
@Freezed()
class Character with _$Character{
  const factory Character({
    required int id,
    @Default('')  String name,
    @Default('')  String status,
    @Default('')  String species,
    @Default('')  String type,
    @Default('')  String gender,
     Origin? origin,
     Location? location,
    @Default('')  String image,
    @Default([])  List<String> episode,
    @Default('')  String url,
    @Default('')  String created
  }) = _Character;



  factory Character.fromJson(Map<String, Object?> json)
  => _$CharacterFromJson(json);
}