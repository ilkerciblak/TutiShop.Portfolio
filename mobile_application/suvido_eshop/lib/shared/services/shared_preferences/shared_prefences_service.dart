import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefencesService {
  final SharedPreferences _prefences;

  SharedPrefencesService({
    required SharedPreferences prefences,
  }) : _prefences = prefences;

  Future<void> saveString(String key, String value) async {
    await _prefences.setString(key, value);
  }

  String? getString(String key) {
    return _prefences.getString(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefences.getBool(key);
  }

  Future<void> removePair(String key) async {
    await _prefences.remove(key);
  }

  Future<void> clearAll(String key) async {
    await _prefences.clear();
  }
}
