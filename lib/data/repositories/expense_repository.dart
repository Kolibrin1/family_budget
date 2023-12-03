import 'package:family_budget/data/api_service.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExpenseRepository {
  ExpenseRepository(this._service);

  final ApiService _service;

  Future<List<ExpenseModel>> getAll(int userId, DateTime dateFrom, DateTime dateTo) async {
    final res = await _service.getMethod(path: "/expense", params: {
      "user_id": userId,
      "dateFrom": dateFrom,
      "dateTo": dateTo,
    });
    return (res.data as List).map((e) => ExpenseModel.fromJson(e)).toList();
  }

  Future<ExpenseModel> createExpense(
      String title, double totalCount, DateTime date, int userId) async {
    final res = await _service.postMethod(path: "/expense", body: {
      "title": title,
      "totalCount": totalCount,
      "date": date,
      "user_id": userId,
    });
    return ExpenseModel.fromJson(res.data);
  }

  Future<ExpenseModel> updateExpense(
      int id, String title, double totalCount, DateTime date, int userId) async {
    final res = await _service.patchMethod(path: "/expense/$id", body: {
      "title": title,
      "totalCount": totalCount,
      "date": date,
      "user_id": userId,
    });

    return ExpenseModel.fromJson(res.data);
  }

  Future<bool> delete(int id) async {
    final res = await _service.deleteMethod(
      path: "/expense/$id",
    );
    return res.data;
  }
}
