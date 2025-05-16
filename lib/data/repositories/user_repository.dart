import 'package:family_budget/data/api_service.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRepository {
  UserRepository(this._service);

  final ApiService _service;

  late UserModel curUser;

  Future<UserModel> getCurrentUser() async {
    try {
      final res = await _service.getMethod(path: "/users/me");
      curUser = UserModel.fromJson(res.data);
      return curUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> findUserByLogin(String login) async {
    try {
      final res = await _service.getMethod(path: "/user/findByLogin", params: {
        "login": login,
      });
      return UserModel.fromJson(res.data);
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> createUser(
      String login, String password, double balance, String currency) async {
    try {
      final res = await _service.postMethod(path: "/user", body: {
        "login": login,
        "password": password,
        "balance": balance,
        "currency": currency,
      });
      curUser = UserModel.fromJson(res.data);
      return curUser;
    } catch (e) {
      throw e;
    }
  }
}
