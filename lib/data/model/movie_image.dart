import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_image_object.dart';

part 'movie_image.freezed.dart';
part 'movie_image.g.dart';

@freezed
class MovieImage with _$MovieImage {
  @JsonSerializable(explicitToJson: true)
  factory MovieImage({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'backdrops') List<MovieImageObject>? backdrops,
    @JsonKey(name: 'posters') List<MovieImageObject>? posters,
  }) = _MovieImage;

  factory MovieImage.fromJson(Map<String, dynamic> json) =>
      _$MovieImageFromJson(json);
}
