import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_config_language.freezed.dart';
part 'api_config_language.g.dart';

@freezed
class ApiConfigLanguage with _$ApiConfigLanguage {
  @JsonSerializable(explicitToJson: true)
  factory ApiConfigLanguage({
    @JsonKey(name: 'iso_639_1') String? iso6391,
    @JsonKey(name: 'english_name') String? englishName,
    @JsonKey(name: 'name') String? name,
  }) = _ApiConfigLanguage;

  factory ApiConfigLanguage.fromJson(Map<String, dynamic> json) =>
      _$ApiConfigLanguageFromJson(json);
}
