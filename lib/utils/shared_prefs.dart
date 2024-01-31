import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesHelper._internal();

  String onboarding_key = "onboarding";


  factory SharedPreferencesHelper() {
    if (_instance == null) {
      _instance = SharedPreferencesHelper._internal();
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }
  // Methods for accessing and manipulating shared preferences

  Future<bool> setShowOnboarding(bool value) {
    return _preferences?.setBool(onboarding_key, value) ?? Future.value(true);
  }

  bool getShowOnboarding() {
    return _preferences?.getBool(onboarding_key) ?? true;
  }



  String getString(String key, {String defaultValue = ''}) {
    return _preferences?.getString(key) ?? defaultValue;
  }

  Future<bool> setString(String key, String value) {
    return _preferences?.setString(key, value) ?? Future.value(false);
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _preferences?.getInt(key) ?? defaultValue;
  }

  Future<bool> setInt(String key, int value) {
    return _preferences?.setInt(key, value) ?? Future.value(false);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _preferences?.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences?.setBool(key, value) ?? Future.value(false);
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences?.getDouble(key) ?? defaultValue;
  }

  Future<bool> setDouble(String key, double value) {
    return _preferences?.setDouble(key, value) ?? Future.value(false);
  }

  List<String> getStringList(String key, {List<String> defaultValue = const []}) {
    return _preferences?.getStringList(key) ?? defaultValue;
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _preferences?.setStringList(key, value) ?? Future.value(false);
  }

  Future<bool> remove(String key) {
    return _preferences?.remove(key) ?? Future.value(false);
  }

  Future<bool> clear() {
    return _preferences?.clear() ?? Future.value(false);
  }
}
