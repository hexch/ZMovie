import 'package:zmovies/data/model/api_config.dart';

extension ApiConfigExtension on ApiConfig {
  String get secureBaseUrl => images?.secureBaseUrl ?? '';
  List<String> get backdropSizes => images?.backdropSizes ?? [];
  List<String> get popularSizes => images?.posterSizes ?? [];
  List<String> get profileSizes => images?.profileSizes ?? [];
}
