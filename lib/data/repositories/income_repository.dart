import 'package:family_budget/data/api_service.dart';
import 'package:family_budget/data/models/income_model.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IncomeRepository {
  IncomeRepository(this._service);

  final ApiService _service;

  Future<List<IncomeModel>> getAll(int userId) async {
    final res = await _service.getMethod(path: "/income", params: {
      "user_id": userId,
    });
    return (res.data as List).map((e) => IncomeModel.fromJson(e)).toList();
  }

  Future<IncomeModel> createIncome(
      String title, double totalCount, DateTime date, int userId) async {
    final res = await _service.postMethod(path: "/income", body: {
      "title": title,
      "totalCount": totalCount,
      "date": date.sendFormat,
      "user_id": userId,
    });
    return IncomeModel.fromJson(res.data);
  }

  Future<IncomeModel> updateExpense(
      int id, String title, double totalCount, DateTime date, int userId) async {
    final res = await _service.patchMethod(path: "/income/$id", body: {
      "title": title,
      "totalCount": totalCount,
      "date": date.sendFormat,
      "user_id": userId,
    });

    return IncomeModel.fromJson(res.data);
  }

  Future<bool> delete(int id) async {
    final res = await _service.deleteMethod(
      path: "/income/$id",
    );
    return res.data;
  }
}
