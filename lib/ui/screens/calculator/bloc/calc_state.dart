part of 'calc_bloc.dart';

sealed class CalculatorState {}

class CalculatorLoadingState extends CalculatorState {}

class CalculatorInitState extends CalculatorState {
  CalculatorInitState({
    this.first,
    this.second,
    this.count,
    this.answer,
    this.searchText,
  });

  final Currency? first;
  final Currency? second;
  final double? count;
  final double? answer;
  final String? searchText;
}

class CalculatorInfoState extends CalculatorState {
  CalculatorInfoState({
    required this.message,
    required this.pageState,
  });

  final String message;
  final PageState pageState;
}
