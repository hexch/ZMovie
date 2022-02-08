import 'package:get/get.dart';

import 'package:zmovies/data/model/app_settings.dart';
import 'package:zmovies/data/repository/local_info_repository.dart';
import 'package:zmovies/getx/app_service.dart';

/// Global settings service.
class AppSettingsService extends AppService {
  /// Instance of this class ,load by Get dependencies.
  static AppSettingsService get me => Get.find();

  /// Version defination.
  /// To control miguration of global settings.
  static const _kAppSettingsVersion = 0;

  /// Global settings model.
  var appSettings = AppSettings(version: 0, language: '', region: '').obs;

  /// Load saved global settings from local storage
  Future<AppSettings> loadAppSettings() async {
    final defaultContryCode = Get.locale?.countryCode ?? 'US';
    final defaultLanguage = Get.locale?.languageCode ?? 'en';
    final defaultAppSettings = AppSettings(
      version: _kAppSettingsVersion,
      language: defaultLanguage,
      region: defaultContryCode,
    );
    final savedAppSettings = await _localInfoRepository.loadAppSettings();
    appSettings(savedAppSettings ?? defaultAppSettings);
    return appSettings.value;
  }

  /// [LocalInfoRepository]instance ,load by Get dependencies.
  final LocalInfoRepository _localInfoRepository = Get.find();
}
