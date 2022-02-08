import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zmovies/data/model/movie_credit_cast.dart';
import 'package:zmovies/data/model/movie_credit_crew.dart';

part 'movie_credit.freezed.dart';
part 'movie_credit.g.dart';

@freezed
class MovieCredit with _$MovieCredit {
  @JsonSerializable(explicitToJson: true)
  factory MovieCredit({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'cast') List<MovieCreditCast>? cast,
    @JsonKey(name: 'crew') List<MovieCreditCrew>? crew,
  }) = _MovieCredit;

  factory MovieCredit.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditFromJson(json);
}
