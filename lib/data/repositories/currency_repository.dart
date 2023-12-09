import 'package:family_budget/data/api_service.dart';
import 'package:family_budget/data/models/conv_model.dart';
import 'package:family_budget/data/models/rate_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CurrencyRepository {
  CurrencyRepository(this._service);

  final ApiService _service;

  Future<ConvModel> getRate(double ammount, String from, String to,) async {
    final res = await _service.getMethod(
      path:
          "/fixer/convert?to=$to&from=$from&amount=$ammount",
    );
    return ConvModel.fromJson(res.data);
  }
}
