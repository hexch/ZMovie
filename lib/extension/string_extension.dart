import 'dart:convert';

extension Json on String {
  /// Convert string to json.
  Map<String, dynamic>? toJson() {
    try {
      return json.decode(this);
    } on FormatException catch (_) {
      return null;
    }
  }

  /// Convert string to jsonArray.
  List<dynamic>? toJsonArray() {
    try {
      return json.decode(this);
    } on FormatException catch (_) {
      return null;
    }
  }
}
