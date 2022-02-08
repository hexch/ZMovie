import 'package:shared_preferences/shared_preferences.dart';

class LocalInfoDataSource {
  Future<bool> save<T>(String key, {required T value}) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    }
    return false;
  }

  Future<T?> load<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (T is String) {
      return prefs.getString(key) as T?;
    } else if (T is bool) {
      return prefs.getBool(key) as T?;
    } else if (T is int) {
      return prefs.getInt(key) as T?;
    } else if (T is double) {
      return prefs.getDouble(key) as T?;
    }
    return null;
  }
}
