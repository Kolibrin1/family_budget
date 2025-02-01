part of 'diagram_bloc.dart';

@freezed
class DiagramEvent with _$DiagramEvent {
  const factory DiagramEvent.initial() = _InitialEvent;

  const factory DiagramEvent.initEditExpense({
    ExpenseModel? expense,
  }) = _InitEditExpenseEvent;

  const factory DiagramEvent.editExpense({
    required int expenseId,
    required int categoryId,
    required double totalCount,
    required DateTime date,
  }) = _EditExpense;

  const factory DiagramEvent.deleteExpense({
    required int expenseId,
  }) = _DeleteExpense;

  const factory DiagramEvent.selectTypeView({
    required int type,
  }) = _SelectTypeView;
}
