import 'package:zmovies/data/model/api_config.dart';

extension ApiConfigExtension on ApiConfig {
  /// null-safe secureBaseUrl string.
  /// Use this to fetch images of backdrops,posters,or profiles
  String get secureBaseUrl => images?.secureBaseUrl ?? '';

  /// null-safe backdropSizes array.
  /// eg. [w300, w780, w1280, original]
  List<String> get backdropSizes => images?.backdropSizes ?? [];

  /// null-safe posterSizes array.
  /// eg. [w92, w154, w185, w342, w500, w780, original]
  List<String> get posterSizes => images?.posterSizes ?? [];

  /// null-safe profileSizes array.
  /// eg. [w45, w185, h632, original],
  List<String> get profileSizes => images?.profileSizes ?? [];
}
