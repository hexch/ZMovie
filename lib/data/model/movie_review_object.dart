import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_review_object_author.dart';

part 'movie_review_object.freezed.dart';
part 'movie_review_object.g.dart';

@freezed
class MovieReviewObject with _$MovieReviewObject {
  @JsonSerializable(explicitToJson: true)
  factory MovieReviewObject({
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'author_details') MovieReviewObjectAuthor? authorDetails,
  }) = _MovieReviewObject;

  factory MovieReviewObject.fromJson(Map<String, dynamic> json) =>
      _$MovieReviewObjectFromJson(json);
}
