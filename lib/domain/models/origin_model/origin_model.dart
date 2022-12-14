import 'package:freezed_annotation/freezed_annotation.dart';

part 'origin_model.freezed.dart';
part 'origin_model.g.dart';
@Freezed()
class Origin with _$Origin {

  const factory Origin({
    @Default('')  String name,
    @Default('')  String url
  }) = _Origin;


  factory Origin.fromJson(Map<String, Object?> json)
  => _$OriginFromJson(json);

}