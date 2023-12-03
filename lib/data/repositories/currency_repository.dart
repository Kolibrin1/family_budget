import 'package:family_budget/data/api_service.dart';
import 'package:family_budget/data/models/rate_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CurrencyRepository {
  CurrencyRepository(this._service);

  final ApiService _service;

  // Future<CurrencyModel> getAll() async {
  //   final res = await _service.getMethod(
  //     path:
  //         "/v1/currencies?key=7d8HvwPxBZlK3S63hytdYEqSS2TutY0nUHlT&output=JSON",
  //   );
  //   return CurrencyModel.fromJson(res.data);
  // }

  Future<RateModel> getRates(String base) async {
    final res = await _service.getMethod(
      path:
          "/v1/rates?key=7d8HvwPxBZlK3S63hytdYEqSS2TutY0nUHlT&base=$base&output=JSON",
    );
    return RateModel.fromJson(res.data);
  }
}
