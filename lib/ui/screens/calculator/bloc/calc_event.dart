part of 'calc_bloc.dart';

@freezed
class CalculatorEvent with _$CalculatorEvent {
  const factory CalculatorEvent.initial() = _InitialEvent;

  const factory CalculatorEvent.calculate({
    required Currency first,
    required Currency second,
    required double count,
    String? searchText,
  }) = _CalculateEvent;
}
