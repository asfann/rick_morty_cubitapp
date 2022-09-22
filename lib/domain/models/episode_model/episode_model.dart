import 'package:freezed_annotation/freezed_annotation.dart';
part 'episode_model.freezed.dart';
part 'episode_model.g.dart';
@Freezed()
class Episode with _$Episode{
  const factory Episode({
    int? id,
    @Default('')  String name,
    @Default('') @JsonKey(name: 'air_date')  String airDate,
    @Default('')   String episode
  }) = _Episode;



  factory Episode.fromJson(Map<String, Object?> json)
  => _$EpisodeFromJson(json);
}