import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_upcoming_result.freezed.dart';
part 'movie_upcoming_result.g.dart';

@freezed
class MovieUpcomingResult with _$MovieUpcomingResult {
  @JsonSerializable(explicitToJson: true)
  factory MovieUpcomingResult({
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
  }) = _MovieUpcomingResult;

  factory MovieUpcomingResult.fromJson(Map<String, dynamic> json) =>
      _$MovieUpcomingResultFromJson(json);
}
