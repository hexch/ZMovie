import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_credit_crew.freezed.dart';
part 'movie_credit_crew.g.dart';

@freezed
class MovieCreditCrew with _$MovieCreditCrew {
  @JsonSerializable(explicitToJson: true)
  factory MovieCreditCrew({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'gender') int? gender,
    @JsonKey(name: 'known_for_department') String? knownForDepartment,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'credit_id') String? creditId,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'job') String? job,
  }) = _MovieCreditCrew;

  factory MovieCreditCrew.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditCrewFromJson(json);
}
