part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.initial() = _InitialEvent;

  const factory ProfileEvent.addExpense({
    required String title,
    required double totalCount,
    required DateTime date,
  }) = _AddExpense;

  const factory ProfileEvent.addIncome({
    required String title,
    required double totalCount,
    required DateTime date,
  }) = AddIncome;
}
