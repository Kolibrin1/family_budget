import 'package:family_budget/data/api_service.dart';
import 'package:family_budget/data/models/currency_model.dart';
import 'package:injectable/injectable.dart';


@singleton
class CurrencyRepository {
  CurrencyRepository(this._service);

  final ApiService _service;

  Future<CurrencyModel> getAll() async {
    final res = await _service.getMethod(
      path: "/v1/currencies?key=7d8HvwPxBZlK3S63hytdYEqSS2TutY0nUHlT&output=JSON",
    );
    return CurrencyModel.fromJson(res.data);
  }

  // Future<User> register(
  //     String phoneNumber,
  //     ) async {
  //   final res = await _service.postMethod(
  //     path: '/auth/register',
  //     body: {
  //       "name": "Не назначен",
  //       "phoneNumber": phoneNumber,
  //       "state": "check",
  //       "sign": true,
  //     },
  //   );
  //   return User.fromJson(res.data);
  // }
  //
  // Future<Session?> refresh(String refreshToken) async {
  //   final res = await _service.postMethod(
  //     path: '/auth/refresh',
  //     params: {
  //       'refreshToken': refreshToken,
  //     },
  //   );
  //   if(res.statusCode == 200) {
  //     return Session.fromJson(res.data);
  //   }
  //   return null;
  // }
  //
  // Future<Session?> login(String phone, String code) async {
  //   final res = await _service.postMethod(
  //     path: '/auth/login',
  //     body: {
  //       'phone': phone,
  //       'code': code,
  //     },
  //
  //   );
  //   if(res.statusCode == 200) {
  //     return Session.fromJson(res.data);
  //   }
  //   return null;
  // }
  //
  // Future<User> getCurrentUser() async {
  //   final res = await _service.getMethod(path: '/auth/me');
  //   return User.fromJson(res.data);
  // }
  //
  // Future<bool> logout() async {
  //   final res = await _service.deleteMethod(path: '/auth/logout');
  //   return res.statusCode == 200;
  // }
}
