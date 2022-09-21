import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_model.freezed.dart';
part 'location_model.g.dart';

@Freezed()
class Location with _$Location {


  const factory Location({
    required String name,
    required String url
  }) = _Location;


  factory Location.fromJson(Map<String, Object?> json)
  => _$LocationFromJson(json);
}