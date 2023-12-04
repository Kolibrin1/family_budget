part of 'diagram_bloc.dart';

@freezed
class DiagramState with _$DiagramState {
  const factory DiagramState.initial({
    required String currency,
    required List<ExpenseModel> expensesList,
    required int type,
    required List<Color> colors,
    required List<String> titles,
    required List<double> totalCounts,
    required double allCount,
  }) = _InitialState;

  const factory DiagramState.loading() = _LoadingState;

  const factory DiagramState.info({
    required String message,
    required PageState pageState,
  }) = _InfoState;
}
