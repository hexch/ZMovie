import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_review_object.dart';

part 'movie_review.freezed.dart';
part 'movie_review.g.dart';

@freezed
class MovieReview with _$MovieReview {
  @JsonSerializable(explicitToJson: true)
  factory MovieReview({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'results') List<MovieReviewObject>? results,
  }) = _MovieReview;

  factory MovieReview.fromJson(Map<String, dynamic> json) =>
      _$MovieReviewFromJson(json);
}
