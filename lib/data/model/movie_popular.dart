import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_popular_result.dart';

part 'movie_popular.freezed.dart';
part 'movie_popular.g.dart';

@freezed
class MoviePopular with _$MoviePopular {
  @JsonSerializable(explicitToJson: true)
  factory MoviePopular({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'results') List<MoviePopularResult>? results,
  }) = _MoviePopular;

  factory MoviePopular.fromJson(Map<String, dynamic> json) =>
      _$MoviePopularFromJson(json);
}
