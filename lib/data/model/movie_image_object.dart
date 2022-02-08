import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_image_object.freezed.dart';
part 'movie_image_object.g.dart';

@freezed
class MovieImageObject with _$MovieImageObject {
  @JsonSerializable(explicitToJson: true)
  factory MovieImageObject({
    @JsonKey(name: 'aspect_ratio') double? aspectRatio,
    @JsonKey(name: 'file_path') String? filePath,
    @JsonKey(name: 'width') int? width,
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _MovieImageObject;

  factory MovieImageObject.fromJson(Map<String, dynamic> json) =>
      _$MovieImageObjectFromJson(json);
}
