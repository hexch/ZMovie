import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'date_object.dart';
import 'movie_now_playing_result.dart';

part 'movie_now_playing.freezed.dart';
part 'movie_now_playing.g.dart';

@freezed
class MovieNowPlaying with _$MovieNowPlaying {
  @JsonSerializable(explicitToJson: true)
  factory MovieNowPlaying({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'results') List<MovieNowPlayingResult>? results,
    @JsonKey(name: 'dates') DateObject? dates,
  }) = _MovieNowPlaying;

  factory MovieNowPlaying.fromJson(Map<String, dynamic> json) =>
      _$MovieNowPlayingFromJson(json);
}
