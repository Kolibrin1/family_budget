import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/data/api_service.dart';
import 'package:family_budget/helpers/preferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepository {
  AuthRepository(this._service);

  final ApiService _service;

  final Preferences prefs = getIt<Preferences>();

  Future<void> register(
      String login, String password, double balance, String currency) async {
    try {
      final res = await _service.postMethod(
        path: "/auth/register",
        body: {
          "login": login,
          "password": password,
          "balance": balance,
          "currency": currency,
        },
      );
      prefs.setStringByKey('token', res.data['access_token']);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> checkLogin(String login) async {
    final res = await _service.getMethod(path: "/auth/check-user/$login", params: {
      "login": login,
    });
    return res.data == true;
  }

  Future<void> login(
    String login,
    String password,
  ) async {
    try {
      final res = await _service.postMethod(
        path: "/auth/login",
        body: {
          "login": login,
          "password": password,
        },
      );
      prefs.setStringByKey('token', res.data['access_token']);
    } catch (e) {
      throw e;
    }

  }
}
