import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_genre.dart';

part 'movie_latest.freezed.dart';
part 'movie_latest.g.dart';

@freezed
class MovieLatest with _$MovieLatest {
  @JsonSerializable(explicitToJson: true)
  factory MovieLatest({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    // @JsonKey(name: 'belongs_to_collection') String? belongsToCollection,
    @JsonKey(name: 'budget') int? budget,
    @JsonKey(name: 'genres') List<MovieGenre>? genres,
    @JsonKey(name: 'homepage') String? homepage,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    // @JsonKey(name: 'production_companies') String? productionCompanies,
    // @JsonKey(name: 'production_countries') String? productionCountries,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'revenue') int? revenue,
    @JsonKey(name: 'runtime') int? runtime,
    //@JsonKey(name: 'spoken_languages') String? spokenLanguages,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _MovieLatest;

  factory MovieLatest.fromJson(Map<String, dynamic> json) =>
      _$MovieLatestFromJson(json);
}
