import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zmovies/data/model/api_config.dart';
import 'package:zmovies/data/model/api_config_country.dart';
import 'package:zmovies/data/model/api_config_language.dart';
import 'package:zmovies/data/model/api_config_timezone.dart';
import 'package:zmovies/data/model/app_settings.dart';
import 'package:zmovies/data/repository/local_info_repository.dart';

import '../../json_mock/json_mock.dart';
import '../../json_mock/mock_api_configuration.dart';

void main() {
  LocalInfoRepository repo = LocalInfoRepositoryImpl();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  test('AppSettings', () async {
    final appSettings = AppSettings(version: 1, language: 'ja', region: 'JP');
    final save = await repo.saveAppSettings(appSettings);
    expect(save, true);
    final load = await repo.loadAppSettings();
    expect(load, appSettings);
  });

  test('ApiConfig', () async {
    final value = ApiConfig.fromJson(mockApiConfig);
    final save = await repo.saveApiConfig(value);
    expect(save, true);
    final load = await repo.loadApiConfig();
    expect(load, value);
  });
  test('Countries', () async {
    final value =
        mockCountries.map((e) => ApiConfigCountry.fromJson(e)).toList();
    final save = await repo.saveContries(value);
    expect(save, true);
    final load = await repo.loadCountries();
    expect(load, value);
  });

  test('Languages', () async {
    final value =
        mockLanguages.map((e) => ApiConfigLanguage.fromJson(e)).toList();
    final save = await repo.saveLanguages(value);
    expect(save, true);
    final load = await repo.loadLanguages();
    expect(load, value);
  });
  test('TimeZones', () async {
    final value =
        mockTimeZones.map((e) => ApiConfigTimeZone.fromJson(e)).toList();
    final save = await repo.saveTimeZones(value);
    expect(save, true);
    final load = await repo.loadTimeZones();
    expect(load, value);
  });
}
