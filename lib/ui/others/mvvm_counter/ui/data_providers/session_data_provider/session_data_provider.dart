import 'package:shared_preferences/shared_preferences.dart';

abstract class SessionDataProviderKeys {
  static const _apiKey = "api_key";
}

class SessionDataProvider {
  final _pref = SharedPreferences.getInstance();

  Future<String?> apiKey() async {
    return (await _pref).getString(SessionDataProviderKeys._apiKey);
  }

  Future<void> saveApiKey(String key) async {
    (await _pref).setString(SessionDataProviderKeys._apiKey, key);
  }

  Future<void> clearApiKey() async {
    (await _pref).remove(SessionDataProviderKeys._apiKey);
  }
}
