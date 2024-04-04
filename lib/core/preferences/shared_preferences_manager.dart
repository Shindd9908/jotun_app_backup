import "dart:convert";

import "package:shared_preferences/shared_preferences.dart";

abstract class PreferenceManager {
  Future<bool> putValue<T>(String key, T value);

  T? getValue<T>(String key);

  Future<void> removeByKey(String key);

  Future<void> clear();
}

class SharedPreferencesManager implements PreferenceManager {
  static SharedPreferencesManager? _instance;
  static SharedPreferences? _sharedPreferences;

  static Future<SharedPreferencesManager> getInstance() async {
    _instance ??= SharedPreferencesManager();
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  @override
  Future<bool> putValue<T>(String key, T value) {
    if (value is bool) {
      return _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      return _sharedPreferences!.setDouble(key, value);
    } else if (value is String) {
      return _sharedPreferences!.setString(key, value);
    } else if (value is List<String>) {
      return _sharedPreferences!.setStringList(key, value);
    } else if (value is Map<String, dynamic>) {
      final jsonString = json.encode(value);
      return _sharedPreferences!.setString(key, jsonString);
    }
    throw Exception("Unsupported value type");
  }

  @override
  T? getValue<T>(String key) {
    if (T == bool) {
      return _sharedPreferences!.getBool(key) as T?;
    } else if (T == double) {
      return _sharedPreferences!.getDouble(key) as T?;
    } else if (T == String) {
      return _sharedPreferences!.getString(key) as T?;
    } else if (T == List<String>) {
      return _sharedPreferences!.getStringList(key) as T?;
    } else if (T == Map<String, dynamic>) {
      final jsonString = _sharedPreferences!.getString(key);
      if (jsonString != null) {
        return json.decode(jsonString) as T?;
      }
      return null;
    }
    throw Exception("Unsupported value type");
  }

  @override
  Future<void> removeByKey(String key) => _sharedPreferences!.remove(key);

  @override
  Future<void> clear() => _sharedPreferences!.clear();
}
