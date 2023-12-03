import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:family_budget/data/models/income_model.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/data/repositories/expense_repository.dart';
import 'package:family_budget/data/repositories/income_repository.dart';
import 'package:family_budget/data/repositories/user_repository.dart';
import 'package:family_budget/helpers/preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../helpers/constants.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.prefs, this.userRepository, this.expenseRepository,
      this.incomeRepository)
      : super(
          const ProfileState.loading(),
        ) {
    on<_InitialEvent>(_onInitialEvent);
    on<_AddExpense>(_onAddExpenseEvent);
    on<AddIncome>(_onAddIncomeEvent);
  }

  ProfileState oldState = const ProfileState.loading();
  final UserRepository userRepository;
  final ExpenseRepository expenseRepository;
  final IncomeRepository incomeRepository;
  final Preferences prefs;
  UserModel? curUser;

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      curUser = await userRepository.getCurrentUser(
        prefs.loadUserLogin()!,
        prefs.loadUserPass()!,
      );
      List<IncomeModel> incomesList =
          await incomeRepository.getAll(curUser!.id!);
      emit(
        ProfileState.initial(
          user: curUser!,
          incomesList: incomesList,
        ),
      );
      oldState = ProfileState.initial(user: curUser!, incomesList: incomesList);
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

  void _onAddExpenseEvent(
    _AddExpense event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      await expenseRepository.createExpense(
        event.title,
        event.totalCount,
        event.date,
        curUser!.id!,
      );
      curUser =
          await userRepository.update(null, null, null, event.totalCount, null);
      List<IncomeModel> incomesList =
          await incomeRepository.getAll(curUser!.id!);
      emit(
        ProfileState.initial(
          user: curUser!,
          incomesList: incomesList,
        ),
      );
      oldState = ProfileState.initial(user: curUser!, incomesList: incomesList);
    } catch (ex) {
      emit(ProfileState.info(
        message: ex.toString(),
        pageState: PageState.error,
      ));
    }
  }

  void _onAddIncomeEvent(
    AddIncome event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      const _LoadingState(),
    );
    try {
      await incomeRepository.createIncome(
        event.title,
        event.totalCount,
        event.date,
        curUser!.id!,
      );
      curUser =
          await userRepository.update(null, null, null, null, event.totalCount);
      List<IncomeModel> incomesList =
          await incomeRepository.getAll(curUser!.id!);
      emit(
        ProfileState.initial(
          user: curUser!,
          incomesList: incomesList,
        ),
      );
      oldState = ProfileState.initial(user: curUser!, incomesList: incomesList);
    } catch (ex) {
      emit(oldState);
      rethrow;
    }
  }
}
