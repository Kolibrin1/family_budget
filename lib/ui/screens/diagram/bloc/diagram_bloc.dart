import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/data/repositories/expense_repository.dart';
import 'package:family_budget/data/repositories/user_repository.dart';
import 'package:family_budget/helpers/preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../helpers/constants.dart';

part 'diagram_event.dart';

part 'diagram_state.dart';

part 'diagram_bloc.freezed.dart';

@injectable
class DiagramBloc extends Bloc<DiagramEvent, DiagramState> {
  DiagramBloc(this.prefs, this.userRepository, this.expenseRepository)
      : super(
          const DiagramState.loading(),
        ) {
    on<_InitialEvent>(_onInitialEvent);
    on<_SelectTypeView>(_onSelectTypeViewEvent);
  }

  DiagramState oldState = const DiagramState.loading();
  final UserRepository userRepository;
  final ExpenseRepository expenseRepository;
  final Preferences prefs;
  UserModel? curUser;

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<DiagramState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      if (curUser == null) {
        curUser = await userRepository.getCurrentUser(
          prefs.loadUserLogin()!,
          prefs.loadUserPass()!,
        );
      }
      List<ExpenseModel> expensesList = await expenseRepository.getAll(
        curUser!.id!,
        DateTime.now().add(const Duration(days: 7)),
        DateTime.now(),
      );
      emit(
        DiagramState.initial(
          currency: curUser!.currency!,
          expensesList: expensesList,
          type: 1,
        ),
      );
      oldState = DiagramState.initial(
        currency: curUser!.currency!,
        expensesList: expensesList,
        type: 1,
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

  void _onSelectTypeViewEvent(
    _SelectTypeView event,
    Emitter<DiagramState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      late List<ExpenseModel> expensesList;
      if (event.type == 1) {
        expensesList = await expenseRepository.getAll(
          curUser!.id!,
          DateTime.now().add(const Duration(days: 7)),
          DateTime.now(),
        );
      } else if (event.type == 2) {
        expensesList = await expenseRepository.getAll(
          curUser!.id!,
          DateTime.now().add(const Duration(days: 30)),
          DateTime.now(),
        );
      } else {
        expensesList = await expenseRepository.getAll(
          curUser!.id!,
          DateTime.now().add(const Duration(days: 365)),
          DateTime.now(),
        );
      }

      emit(
        DiagramState.initial(
          currency: curUser!.currency!,
          expensesList: expensesList,
          type: event.type,
        ),
      );
      oldState = DiagramState.initial(
        currency: curUser!.currency!,
        expensesList: expensesList,
        type: event.type,
      );
    } catch (ex) {
      emit(DiagramState.info(
        message: ex.toString(),
        pageState: PageState.error,
      ));
    }
  }
}
