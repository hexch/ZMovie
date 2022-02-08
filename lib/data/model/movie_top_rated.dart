import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_top_rated_result.dart';

part 'movie_top_rated.freezed.dart';
part 'movie_top_rated.g.dart';

@freezed
class MovieTopRated with _$MovieTopRated {
  @JsonSerializable(explicitToJson: true)
  factory MovieTopRated({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'results') List<MovieTopRatedResult>? results,
  }) = _MovieTopRated;

  factory MovieTopRated.fromJson(Map<String, dynamic> json) =>
      _$MovieTopRatedFromJson(json);
}
