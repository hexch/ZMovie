import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_popular_result.freezed.dart';
part 'movie_popular_result.g.dart';

@freezed
class MoviePopularResult with _$MoviePopularResult {
  @JsonSerializable(explicitToJson: true)
  factory MoviePopularResult({
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _MoviePopularResult;

  factory MoviePopularResult.fromJson(Map<String, dynamic> json) =>
      _$MoviePopularResultFromJson(json);
}
