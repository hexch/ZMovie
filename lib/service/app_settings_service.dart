import 'package:get/get.dart';

import 'package:zmovies/data/model/app_settings.dart';
import 'package:zmovies/data/repository/local_info_repository.dart';
import 'package:zmovies/getx/app_service.dart';

class AppSettingsService extends AppService {
  static AppSettingsService get me => Get.find();

  static const _kAppSettingsVersion = 0;
  var appSettings = AppSettings(version: 0, language: '', region: '').obs;

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

  final LocalInfoRepository _localInfoRepository = Get.find();
}
