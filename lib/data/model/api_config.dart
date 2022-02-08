import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/api_config_images.dart';

part 'api_config.freezed.dart';
part 'api_config.g.dart';

@freezed
class ApiConfig with _$ApiConfig {
  @JsonSerializable(explicitToJson: true)
  factory ApiConfig({
    @JsonKey(name: 'images') ApiConfigImages? images,
    @JsonKey(name: 'change_keys') List<String>? changeKeys,
  }) = _ApiConfig;

  factory ApiConfig.fromJson(Map<String, dynamic> json) =>
      _$ApiConfigFromJson(json);
}
