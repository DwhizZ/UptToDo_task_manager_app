import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> write(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    }
  }

//Todo: remove one of this read functions

  static Future<Object?> read(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<bool?> readBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
