import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_config_images.freezed.dart';
part 'api_config_images.g.dart';

@freezed
class ApiConfigImages with _$ApiConfigImages {
  @JsonSerializable(explicitToJson: true)
  factory ApiConfigImages({
    @JsonKey(name: 'base_url') String? baseUrl,
    @JsonKey(name: 'secure_base_url') String? secureBaseUrl,
    @JsonKey(name: 'backdrop_sizes') List<String>? backdropSizes,
    @JsonKey(name: 'logo_sizes') List<String>? logoSizes,
    @JsonKey(name: 'poster_sizes') List<String>? posterSizes,
    @JsonKey(name: 'profile_sizes') List<String>? profileSizes,
    @JsonKey(name: 'still_sizes') List<String>? stillSizes,
  }) = _ApiConfigImages;

  factory ApiConfigImages.fromJson(Map<String, dynamic> json) =>
      _$ApiConfigImagesFromJson(json);
}
