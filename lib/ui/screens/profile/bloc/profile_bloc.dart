import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:family_budget/data/models/category_model.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/data/models/income_model.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/data/repositories/category_repository.dart';
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
    on<_InitExpenseEvent>(_onInitExpenseEvent);
    on<_InitIncomeEvent>(_onInitIncomeEvent);
    on<_AddExpense>(_onAddExpenseEvent);
    on<_AddIncome>(_onAddIncomeEvent);
    on<_EditIncome>(_onEditIncomeEvent);
    on<_DeleteIncome>(_onDeleteIncomeEvent);
  }

  ProfileState oldState = const ProfileState.loading();
  final UserRepository userRepository;
  final ExpenseRepository expenseRepository;
  final IncomeRepository incomeRepository;
  final Preferences prefs;
  UserModel? curUser;
  List<IncomeModel> incomesList = [];

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const _LoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    try {
      curUser = await userRepository.getCurrentUser();
      incomesList = await incomeRepository.getAll();
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

  void _onInitExpenseEvent(
    _InitExpenseEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      emit(
        ProfileState.addExpense(
          expense: event.expense,
        ),
      );
      oldState = ProfileState.addExpense(
        expense: event.expense,
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

  void _onInitIncomeEvent(
    _InitIncomeEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      emit(
        ProfileState.addIncome(
          income: event.income,
        ),
      );
      oldState = ProfileState.addIncome(
        income: event.income,
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

  void _onAddExpenseEvent(
    _AddExpense event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      await expenseRepository.createExpense(
        event.totalCount,
        event.categoryId,
        event.date,
      );
      curUser =
          curUser!.copyWith(balance: curUser!.balance! - event.totalCount);
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
    _AddIncome event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      const _LoadingState(),
    );
    try {
      await incomeRepository.createIncome(
        event.totalCount,
        event.categoryId,
        event.date,
      );
      curUser =
          curUser!.copyWith(balance: curUser!.balance! + event.totalCount);
      incomesList = await incomeRepository.getAll();
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

  void _onEditIncomeEvent(
    _EditIncome event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      const _LoadingState(),
    );
    try {
      await incomeRepository.updateIncome(
        event.incomeId,
        event.categoryId,
        event.totalCount,
        event.date,
      );
      curUser = await userRepository.getCurrentUser();
      incomesList = await incomeRepository.getAll();
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

  void _onDeleteIncomeEvent(
      _DeleteIncome event,
      Emitter<ProfileState> emit,
      ) async {
    emit(
      const _LoadingState(),
    );
    try {
      await incomeRepository.delete(
        event.incomeId,
      );
      curUser = await userRepository.getCurrentUser();
      // incomesList = await incomeRepository.getAll();
      incomesList.removeWhere((e) => e.id == event.incomeId);
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
