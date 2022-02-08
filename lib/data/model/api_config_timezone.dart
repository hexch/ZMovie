import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_config_timezone.freezed.dart';
part 'api_config_timezone.g.dart';

@freezed
class ApiConfigTimeZone with _$ApiConfigTimeZone {
  @JsonSerializable(explicitToJson: true)
  factory ApiConfigTimeZone({
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    @JsonKey(name: 'zones') List<String>? zones,
  }) = _ApiConfigTimeZone;

  factory ApiConfigTimeZone.fromJson(Map<String, dynamic> json) =>
      _$ApiConfigTimeZoneFromJson(json);
}
