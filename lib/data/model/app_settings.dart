import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  @JsonSerializable(explicitToJson: true)
  factory AppSettings({
    @JsonKey(name: 'version') required int version,
    @JsonKey(name: 'language') required String language,
    @JsonKey(name: 'region') required String region,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
