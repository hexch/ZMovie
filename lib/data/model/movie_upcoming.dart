import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_upcoming_result.dart';

import 'date_object.dart';

part 'movie_upcoming.freezed.dart';
part 'movie_upcoming.g.dart';

@freezed
class MovieUpcoming with _$MovieUpcoming {
  @JsonSerializable(explicitToJson: true)
  factory MovieUpcoming({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'results') List<MovieUpcomingResult>? results,
    @JsonKey(name: 'dates') DateObject? dates,
  }) = _MovieUpcoming;

  factory MovieUpcoming.fromJson(Map<String, dynamic> json) =>
      _$MovieUpcomingFromJson(json);
}
