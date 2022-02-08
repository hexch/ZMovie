import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_object.freezed.dart';
part 'date_object.g.dart';

@freezed
class DateObject with _$DateObject {
  @JsonSerializable(explicitToJson: true)
  factory DateObject({
    @JsonKey(name: 'maximum') String? maximum,
    @JsonKey(name: 'minimum') String? minimum,
  }) = _DateObject;

  factory DateObject.fromJson(Map<String, dynamic> json) =>
      _$DateObjectFromJson(json);
}
