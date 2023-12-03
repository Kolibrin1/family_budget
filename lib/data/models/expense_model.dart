import 'package:freezed_annotation/freezed_annotation.dart';


part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@Freezed()
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({

    int? id,
    double? totalCount,
    String? title,
    DateTime? date,
    int? userId,

  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, Object?> json) => _$ExpenseModelFromJson(json);
}
