import 'dart:convert';

extension Json on String {
  Map<String, dynamic>? toJson() {
    try {
      return json.decode(this);
    } on FormatException catch (_) {
      return null;
    }
  }

  List<Map<String, dynamic>>? toJsonArray() {
    try {
      return json.decode(this);
    } on FormatException catch (_) {
      return null;
    }
  }
}
