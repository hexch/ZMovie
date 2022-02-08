import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_review_object_author.freezed.dart';
part 'movie_review_object_author.g.dart';

@freezed
class MovieReviewObjectAuthor with _$MovieReviewObjectAuthor {
  @JsonSerializable(explicitToJson: true)
  factory MovieReviewObjectAuthor({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'avatar_path') String? avatarPath,
    @JsonKey(name: 'rating') int? rating,
  }) = _MovieReviewObjectAuthor;

  factory MovieReviewObjectAuthor.fromJson(Map<String, dynamic> json) =>
      _$MovieReviewObjectAuthorFromJson(json);
}
