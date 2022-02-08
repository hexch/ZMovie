import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_genre.dart';

part 'movie_genre_list.freezed.dart';
part 'movie_genre_list.g.dart';

@freezed
class MovieGenreList with _$MovieGenreList {
  @JsonSerializable(explicitToJson: true)
  factory MovieGenreList({
    @JsonKey(name: 'genres') List<MovieGenre>? genres,
  }) = _MovieGenreList;

  factory MovieGenreList.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreListFromJson(json);
}
