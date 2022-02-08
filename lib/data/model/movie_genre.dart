import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_genre.freezed.dart';
part 'movie_genre.g.dart';

@freezed
class MovieGenre with _$MovieGenre {
  @JsonSerializable(explicitToJson: true)
  factory MovieGenre({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _MovieGenre;

  factory MovieGenre.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreFromJson(json);
}
