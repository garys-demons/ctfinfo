import 'dart:convert';
import 'package:ctfinfo/features/teams/models/team_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static SharedPreferences? _prefs;

  static String teamId = 'teamId';
  static String isTeamIdSavedKey = 'isTeamIdSaved';

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> setInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);

  static Future<bool> setTeamDetail(String key, TeamDetailModel data) async {
    return await setModel(key, data);
  }

  static Future<void> saveTeamId() async {
    await _prefs!.setBool(isTeamIdSavedKey, true);
  }

  static Future<bool> setModel<T>(String key, T model) async {
    assert(_prefs != null, 'Call initialize() before using preferences,');
    final String jsonString = jsonEncode(model);
    return await _prefs!.setString(key, jsonString);
  }

  static T? getModel<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    assert(_prefs != null, 'Call initialize() before using preferences.');
    final String? jsonString = _prefs!.getString(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }

  static bool isTeamIdSaved() {
    return _prefs!.getBool(isTeamIdSavedKey) ?? false;
  }

  static int getInt(String key) => _prefs!.getInt(key) ?? 0;

  static String getString(String key) => _prefs!.getString(key) ?? '';

  static Future<bool> remove(String key) async => await _prefs!.remove(key);

  static Future<bool> clear() async => await _prefs!.clear();
}
