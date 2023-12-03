import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'keys.dart';

@lazySingleton
class Preferences {
  Preferences(this._prefs);

  final SharedPreferences _prefs;

  Future<void> saveUserLogin(String login) async {
    await _prefs.setString(Keys.userLogin, login);
  }

  Future<void> saveUserPass(String pass) async {
    await _prefs.setString(Keys.userPassword, pass);
  }

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
  String? loadUserLogin() {
    if (_prefs.containsKey(Keys.userLogin)) {
      final login = _prefs.getString(Keys.userLogin);
      return login;
    }
    return null;
  }

  String? loadUserPass() {
    if (_prefs.containsKey(Keys.userPassword)) {
      final pass = _prefs.getString(Keys.userPassword);
      return pass;
    }
    return null;
  }

  Future<void> clear() async {
    _prefs.clear();
  }

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
