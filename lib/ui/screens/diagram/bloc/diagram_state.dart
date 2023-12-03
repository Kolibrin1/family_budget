part of 'diagram_bloc.dart';

@freezed
class DiagramState with _$DiagramState {
  const factory DiagramState.initial({
    required String currency,
    required List<ExpenseModel> expensesList,
    required int type,
  }) = _InitialState;

  const factory DiagramState.loading() = _LoadingState;

  const factory DiagramState.info({
    required String message,
    required PageState pageState,
  }) = _InfoState;
}
