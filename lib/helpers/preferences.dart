// import 'package:flowers/constants/keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class Preferences {
  Preferences(this._prefs);

  final SharedPreferences _prefs;

  // Future<void> saveAccessToken(String token) async {
  //   await _prefs.setString(Keys.accessToken, token);
  // }
  //
  // Future<void> saveSplashInit(bool isOpen) async {
  //   await _prefs.setBool(Keys.splashInit, isOpen);
  // }
  //
  // Future<void> saveFirstInit(bool isFirst) async {
  //   await _prefs.setBool(Keys.firstInit, isFirst);
  // }
  //
  // Future<void> saveAfterRegister(bool afterReg) async {
  //   await _prefs.setBool(Keys.afterReg, afterReg);
  // }
  //
  // bool? loadFirstInit() {
  //   return _prefs.getBool(Keys.firstInit);
  // }
  //
  // bool? loadSplashInit() {
  //   return _prefs.getBool(Keys.splashInit);
  // }
  //
  // bool? loadAfterRegister() {
  //   return _prefs.getBool(Keys.afterReg);
  // }
  //
  // String? loadAccessToken() {
  //   if (_prefs.containsKey(Keys.accessToken)) {
  //     final token = _prefs.getString(Keys.accessToken);
  //     return token;
  //   }
  //   return null;
  // }
  //
  // Future<void> deleteAccessToken() async {
  //   _prefs.remove(Keys.accessToken);
  // }
  //
  // Future<void> deleteRefreshToken() async {
  //   _prefs.remove(Keys.refreshToken);
  // }

  Future<void> clear() async {
    _prefs.clear();
  }

  // Future<void> saveRefreshToken(String token) async {
  //   await _prefs.setString(Keys.refreshToken, token);
  // }
  //
  // String? loadRefreshToken() {
  //   return _prefs.containsKey(Keys.refreshToken)
  //       ? _prefs.getString(Keys.refreshToken)
  //       : '';
  // }
  //
  // Future<void> saveTokenSession(DateTime tokenSession) async {
  //   await _prefs.setString(Keys.tokenSession, tokenSession.toString());
  // }
  //
  // Future<void> deleteTokenSession() async {
  //   await _prefs.remove(Keys.tokenSession);
  // }
  //
  // String? loadTokenSession() {
  //   return _prefs.containsKey(Keys.tokenSession)
  //       ? _prefs.getString(Keys.tokenSession)
  //       : '';
  // }

  Future<void> setStringByKey(String key, String str) async {
    await _prefs.setString(key, str);
  }

  String? getStringByKey(String key) {
    return _prefs.containsKey(key) ? _prefs.getString(key) : null;
  }

  List<String>? getListByKey(String key) {
    return _prefs.containsKey(key) ? _prefs.getStringList(key) : null;
  }

  Future<void> setListByKey(String key, List<String> list) async {
    await _prefs.setStringList(key, list);
  }

  Future<void> setIntByKey(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int? getIntByKey(String key) {
    return _prefs.containsKey(key) ? _prefs.getInt(key) : null;
  }

  bool getBoolByKey(String key) {
    return _prefs.containsKey(key) ? _prefs.getBool(key)! : true;
  }

  Future<void> setBoolByKey(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  Future<bool> deleteByKey(String key) async {
    return await _prefs.remove(key);
  }
}
