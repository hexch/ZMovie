import 'package:zmovies/data/model/movie_credit_cast.dart';
import 'package:zmovies/data/model/movie_credit_crew.dart';

class PeopleModel {
  PeopleModel(
    this.id,
    this.name,
    this.gender,
    this.imagePath,
    this.info,
    this.adult,
  );
  final String? imagePath;
  final String name;
  final String info;
  final int gender;
  final int id;
  final bool adult;
}

extension MovieCreditCastExtension on MovieCreditCast {
  PeopleModel toPeopleModel([String? profilePathPrefix]) => PeopleModel(
        id ?? -1,
        name ?? '',
        gender ?? 0,
        profilePathPrefix == null || profilePath == null
            ? null
            : '$profilePathPrefix$profilePath',
        character ?? '',
        adult ?? false,
      );
}

extension MovieCrewExtension on MovieCreditCrew {
  PeopleModel toPeopleModel(
          [String? profilePathPrefix, String? joinedDepartment]) =>
      PeopleModel(
        id ?? -1,
        name ?? '',
        gender ?? 0,
        profilePathPrefix == null || profilePath == null
            ? null
            : '$profilePathPrefix$profilePath',
        joinedDepartment ?? department ?? '',
        adult ?? false,
      );
}
