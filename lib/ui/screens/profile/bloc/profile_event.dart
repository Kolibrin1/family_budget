part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.initial() = _InitialEvent;

  const factory ProfileEvent.initExpense({
    ExpenseModel? expense,
  }) = _InitExpenseEvent;

  const factory ProfileEvent.initIncome({
    IncomeModel? income,
  }) = _InitIncomeEvent;

  const factory ProfileEvent.addExpense({
    required double totalCount,
    required int categoryId,
    required DateTime date,
  }) = _AddExpense;

  const factory ProfileEvent.addIncome({
    required double totalCount,
    required int categoryId,
    required DateTime date,
  }) = _AddIncome;

  const factory ProfileEvent.editIncome({
    required int incomeId,
    required int categoryId,
    required double totalCount,
    required DateTime date,
  }) = _EditIncome;

  const factory ProfileEvent.deleteIncome({
    required int incomeId,
  }) = _DeleteIncome;
}
