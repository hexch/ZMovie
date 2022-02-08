import 'dart:convert';

import 'package:zmovies/data/model/api_config_country.dart';
import 'package:zmovies/data/model/api_config_language.dart';
import 'package:zmovies/data/model/api_config_timezone.dart';
import 'package:zmovies/data/model/app_settings.dart';
import 'package:zmovies/extension/app_extensions.dart';
import 'package:zmovies/data/datasource/locale/local_info_data_source.dart';
import 'package:zmovies/data/model/api_config.dart';

/// IF of local storage service
abstract class LocalInfoRepository {
  Future saveAppSettings(AppSettings value);
  Future<AppSettings?> loadAppSettings();
  Future saveApiConfig(ApiConfig value);
  Future<ApiConfig?> loadApiConfig();
  Future saveContries(List<ApiConfigCountry> value);
  Future<List<ApiConfigCountry>?> loadCountries();

  Future saveLanguages(List<ApiConfigLanguage> value);
  Future<List<ApiConfigLanguage>?> loadLanguages();
  Future saveTimeZones(List<ApiConfigTimeZone> value);
  Future<List<ApiConfigTimeZone>?> loadTimeZones();
}

class LocalInfoRepositoryImpl extends LocalInfoRepository {
  LocalInfoRepositoryImpl({LocalInfoDataSource? dataSource})
      : _dataSource = dataSource ?? LocalInfoDataSource();

  @override
  Future saveAppSettings(AppSettings value) async {
    final jsonString = json.encode(value);
    await _dataSource.save(_kApiConfig, value: jsonString);
  }

  @override
  Future<AppSettings?> loadAppSettings() async {
    String value = await _dataSource.load(_kAppSettings) ?? '';
    try {
      return AppSettings.fromJson(value.toJson() ?? {});
    } catch (_) {
      return null;
    }
  }

  @override
  Future saveApiConfig(ApiConfig value) async {
    final jsonString = json.encode(value);
    await _dataSource.save(_kApiConfig, value: jsonString);
  }

  @override
  Future<ApiConfig?> loadApiConfig() async {
    String value = await _dataSource.load(_kApiConfig) ?? '';
    try {
      return ApiConfig.fromJson(value.toJson() ?? {});
    } catch (_) {
      return null;
    }
  }

  @override
  Future saveContries(List<ApiConfigCountry> value) async {
    final jsonString = json.encode(value);
    await _dataSource.save(_kCountries, value: jsonString);
  }

  @override
  Future<List<ApiConfigCountry>?> loadCountries() async {
    String value = await _dataSource.load(_kCountries) ?? '';
    try {
      final jsonArray = value.toJsonArray() ?? [];
      return jsonArray.map((e) => ApiConfigCountry.fromJson(e)).toList();
    } catch (_) {
      return null;
    }
  }

  @override
  Future saveLanguages(List<ApiConfigLanguage> value) async {
    final jsonString = json.encode(value);
    await _dataSource.save(_kLanguages, value: jsonString);
  }

  @override
  Future<List<ApiConfigLanguage>?> loadLanguages() async {
    String value = await _dataSource.load(_kLanguages) ?? '';
    try {
      final jsonArray = value.toJsonArray() ?? [];
      return jsonArray.map((e) => ApiConfigLanguage.fromJson(e)).toList();
    } catch (_) {
      return null;
    }
  }

  @override
  Future saveTimeZones(List<ApiConfigTimeZone> value) async {
    final jsonString = json.encode(value);
    await _dataSource.save(_kTimezones, value: jsonString);
  }

  @override
  Future<List<ApiConfigTimeZone>?> loadTimeZones() async {
    String value = await _dataSource.load(_kTimezones) ?? '';
    try {
      final jsonArray = value.toJsonArray() ?? [];
      return jsonArray.map((e) => ApiConfigTimeZone.fromJson(e)).toList();
    } catch (_) {
      return null;
    }
  }

  final LocalInfoDataSource _dataSource;
  static const String _kAppSettings = 'app_settings';
  static const String _kApiConfig = 'api_config';
  static const String _kCountries = 'api_config_countries';
  static const String _kLanguages = 'api_config_languages';
  static const String _kTimezones = 'api_config_timezones';
}
