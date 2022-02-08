import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_config_country.freezed.dart';
part 'api_config_country.g.dart';

@freezed
class ApiConfigCountry with _$ApiConfigCountry {
  @JsonSerializable(explicitToJson: true)
  factory ApiConfigCountry({
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    @JsonKey(name: 'english_name') String? englishName,
    @JsonKey(name: 'native_name') String? nativeName,
  }) = _ApiConfigCountry;

  factory ApiConfigCountry.fromJson(Map<String, dynamic> json) =>
      _$ApiConfigCountryFromJson(json);
}
