part of 'calc_bloc.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState.initial({
    Currency? first,
    Currency? second,
    double? count,
    double? answer,
    String? searchText,
  }) = _InitialState;

  const factory CalculatorState.loading() = _LoadingState;

  const factory CalculatorState.info({
    required String message,
    required PageState pageState,
  }) = _InfoState;
}
