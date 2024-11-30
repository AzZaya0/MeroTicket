import 'package:template/core/preferences/tokenModel.dart';

abstract class BasePreferences {
  Future<int?> getInt(String key);
  Future<int> getIntOrElse(String key, int defaultValue);
  Future<bool> setInt(String key, int value);

  Future<bool?> getBool(String key);
  Future<bool> getBoolOrElse(String key, bool defaultValue);
  Future<bool> setBool(String key, bool value);

  Future<double?> getDouble(String key);
  Future<double> getDoubleOrElse(String key, double defaultValue);

  Future<String?> getString(String key);
  Future<String> getStringOrElse(String key, String defaultValue);
  Future<bool> setString(String key, String value);

  Future<bool> putBoolean(String key, bool value);
  Future<bool> setStringList(String key, List<String> value);
  Future<List<String>?> getStringList(String key);

  Future<TokenModel> getTokens();
}
