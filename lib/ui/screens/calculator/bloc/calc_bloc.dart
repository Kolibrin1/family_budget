import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:family_budget/data/repositories/currency_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../helpers/constants.dart';

part 'calc_event.dart';

part 'calc_state.dart';

part 'calc_bloc.freezed.dart';

@injectable
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc(
    this._currencyRepo,
  ) : super(
          const CalculatorState.loading(),
        ) {
    on<_InitialEvent>(_onInitialEvent);
    on<_CalculateEvent>(_onCalculateEvent);
  }

  CalculatorState oldState = const CalculatorState.loading();
  final CurrencyRepository _currencyRepo;

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<CalculatorState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      emit(
        const CalculatorState.initial(),
      );
      oldState = const CalculatorState.initial();
    } catch (ex) {
      ex as DioException;
      if (ex.response != null) {
        emit(
          _InfoState(
            message: ex.response!.data.toString(),
            pageState: PageState.error,
          ),
        );
      } else {
        emit(
          _InfoState(
            message: ex.toString(),
            pageState: PageState.error,
          ),
        );
      }
    }
  }

  void _onCalculateEvent(
    _CalculateEvent event,
    Emitter<CalculatorState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      final conv = await _currencyRepo.getRate(
          event.count, event.first.value, event.second.value);
      final answer = double.parse(conv.result.toStringAsFixed(2));

      emit(
        CalculatorState.initial(
          first: event.first,
          second: event.second,
          count: event.count,
          answer: answer,
          searchText: event.searchText,
        ),
      );
      oldState = CalculatorState.initial(
        first: event.first,
        second: event.second,
        count: event.count,
        answer: answer,
        searchText: event.searchText,
      );
    } catch (ex) {
      ex as DioException;
      if (ex.response != null) {
        emit(
          _InfoState(
            message: ex.response!.data.toString(),
            pageState: PageState.error,
          ),
        );
      } else {
        emit(
          _InfoState(
            message: ex.toString(),
            pageState: PageState.error,
          ),
        );
      }
    }
  }
}
