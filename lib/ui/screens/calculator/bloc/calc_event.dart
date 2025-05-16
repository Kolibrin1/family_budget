part of 'calc_bloc.dart';

sealed class CalculatorEvent {}

class CalculatorInitEvent extends CalculatorEvent {
  CalculatorInitEvent();
}

class CalculatorSearchCurrencyEvent extends CalculatorEvent {
  CalculatorSearchCurrencyEvent({
    required this.value,
  });

  final String value;
}

class CalculateEvent extends CalculatorEvent {
  CalculateEvent({
    required this.first,
    required this.second,
    required this.count,
    this.searchText,
  });

  final Currency first;
  final Currency second;
  final double count;
  final String? searchText;
}
