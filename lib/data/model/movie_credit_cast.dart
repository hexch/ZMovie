import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_credit_cast.freezed.dart';
part 'movie_credit_cast.g.dart';

@freezed
class MovieCreditCast with _$MovieCreditCast {
  @JsonSerializable(explicitToJson: true)
  factory MovieCreditCast({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'gender') int? gender,
    @JsonKey(name: 'known_for_department') String? knownForDepartment,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'cast_id') int? castId,
    @JsonKey(name: 'character') String? character,
    @JsonKey(name: 'credit_id') String? creditId,
    @JsonKey(name: 'order') int? order,
  }) = _MovieCreditCast;

  factory MovieCreditCast.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditCastFromJson(json);
}
