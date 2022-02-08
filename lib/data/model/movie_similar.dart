import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_similar_result.dart';

part 'movie_similar.freezed.dart';
part 'movie_similar.g.dart';

@freezed
class MovieSimilar with _$MovieSimilar {
  @JsonSerializable(explicitToJson: true)
  factory MovieSimilar({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'results') List<MovieSimilarResult>? results,
  }) = _MovieSimilar;

  factory MovieSimilar.fromJson(Map<String, dynamic> json) =>
      _$MovieSimilarFromJson(json);
}
