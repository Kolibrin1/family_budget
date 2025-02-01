import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/data/repositories/expense_repository.dart';
import 'package:family_budget/data/repositories/user_repository.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/helpers/preferences.dart';
import 'package:flutter/material.dart';
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
    on<_InitEditExpenseEvent>(_onInitEditExpenseEvent);
    on<_EditExpense>(_onEditExpenseEvent);
    on<_DeleteExpense>(_onDeleteExpenseEvent);
    on<_SelectTypeView>(_onSelectTypeViewEvent);
  }

  DiagramState oldState = const DiagramState.loading();
  final UserRepository userRepository;
  final ExpenseRepository expenseRepository;
  final Preferences prefs;
  UserModel? curUser;
  List<ExpenseModel> expensesList = [];
  List<Color> colors = [];
  List<String> titles = [];
  List<double> totalCounts = [];
  double allCount = 0;

  int type = 1;

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<DiagramState> emit,
  ) async {
    emit(const _LoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    try {
      curUser ??= await userRepository.getCurrentUser();
      expensesList = await expenseRepository.getAll(
        DateTime.now(),
        DateTime.now(),
      );
      colors = [];
      titles = [];
      totalCounts = [];
      allCount = 0;
      if (expensesList.isNotEmpty) {
        for (var i = 0; i < expensesList.length; i++) {
          if (!titles.contains(expensesList[i].category?.name)) {
            titles.add(expensesList[i].category!.name!);
            colors.add(hexToColor(expensesList[i].category!.color!));
            totalCounts.add(expensesList[i].totalCount!);
          } else {
            totalCounts[titles.indexOf(expensesList[i].category!.name!)] +=
                expensesList[i].totalCount!;
          }
          allCount += expensesList[i].totalCount!;
        }
      }

      emit(
        DiagramState.initial(
          currency: curUser!.currency!,
          expensesList: expensesList,
          type: 1,
          colors: colors,
          allCount: allCount,
          titles: titles,
          totalCounts: totalCounts,
        ),
      );
      oldState = DiagramState.initial(
        currency: curUser!.currency!,
        expensesList: expensesList,
        type: 1,
        colors: colors,
        allCount: allCount,
        titles: titles,
        totalCounts: totalCounts,
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

  void _onInitEditExpenseEvent(
    _InitEditExpenseEvent event,
    Emitter<DiagramState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      emit(
        DiagramState.editExpense(
          expense: event.expense,
        ),
      );
      oldState = DiagramState.editExpense(
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

  void _onEditExpenseEvent(
    _EditExpense event,
    Emitter<DiagramState> emit,
  ) async {
    emit(
      const _LoadingState(),
    );
    try {
      await expenseRepository.updateExpense(
        event.expenseId,
        event.categoryId,
        event.totalCount,
        event.date,
      );
      if (type == 1) {
        expensesList = await expenseRepository.getAll(
          DateTime.now(),
          DateTime.now(),
        );
      } else if (type == 2) {
        expensesList = await expenseRepository.getAll(
          DateTime.now().add(const Duration(days: -7)),
          DateTime.now(),
        );
      } else {
        expensesList = await expenseRepository.getAll(
          DateTime.now().add(const Duration(days: -30)),
          DateTime.now(),
        );
      }
      colors = [];
      titles = [];
      totalCounts = [];
      allCount = 0;
      if (expensesList.isNotEmpty) {
        for (var i = 0; i < expensesList.length; i++) {
          if (!titles.contains(expensesList[i].category?.name)) {
            titles.add(expensesList[i].category!.name!);
            colors.add(hexToColor(expensesList[i].category!.color!));
            totalCounts.add(expensesList[i].totalCount!);
          } else {
            totalCounts[titles.indexOf(expensesList[i].category!.name!)] +=
                expensesList[i].totalCount!;
          }
          allCount += expensesList[i].totalCount!;
        }
      }
      emit(
        DiagramState.initial(
          currency: curUser!.currency!,
          expensesList: expensesList,
          type: type,
          colors: colors,
          allCount: allCount,
          titles: titles,
          totalCounts: totalCounts,
        ),
      );
      oldState = DiagramState.initial(
        currency: curUser!.currency!,
        expensesList: expensesList,
        type: type,
        colors: colors,
        allCount: allCount,
        titles: titles,
        totalCounts: totalCounts,
      );
    } catch (ex) {
      emit(oldState);
      rethrow;
    }
  }

  void _onDeleteExpenseEvent(
      _DeleteExpense event,
      Emitter<DiagramState> emit,
      ) async {
    emit(
      const _LoadingState(),
    );
    try {
      await expenseRepository.delete(
        event.expenseId,
      );
      if (type == 1) {
        expensesList = await expenseRepository.getAll(
          DateTime.now(),
          DateTime.now(),
        );
      } else if (type == 2) {
        expensesList = await expenseRepository.getAll(
          DateTime.now().add(const Duration(days: -7)),
          DateTime.now(),
        );
      } else {
        expensesList = await expenseRepository.getAll(
          DateTime.now().add(const Duration(days: -30)),
          DateTime.now(),
        );
      }
      colors = [];
      titles = [];
      totalCounts = [];
      allCount = 0;
      if (expensesList.isNotEmpty) {
        for (var i = 0; i < expensesList.length; i++) {
          if (!titles.contains(expensesList[i].category?.name)) {
            titles.add(expensesList[i].category!.name!);
            colors.add(hexToColor(expensesList[i].category!.color!));
            totalCounts.add(expensesList[i].totalCount!);
          } else {
            totalCounts[titles.indexOf(expensesList[i].category!.name!)] +=
            expensesList[i].totalCount!;
          }
          allCount += expensesList[i].totalCount!;
        }
      }
      emit(
        DiagramState.initial(
          currency: curUser!.currency!,
          expensesList: expensesList,
          type: type,
          colors: colors,
          allCount: allCount,
          titles: titles,
          totalCounts: totalCounts,
        ),
      );
      oldState = DiagramState.initial(
        currency: curUser!.currency!,
        expensesList: expensesList,
        type: type,
        colors: colors,
        allCount: allCount,
        titles: titles,
        totalCounts: totalCounts,
      );
    } catch (ex) {
      emit(oldState);
      rethrow;
    }
  }

  void _onSelectTypeViewEvent(
    _SelectTypeView event,
    Emitter<DiagramState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      late List<ExpenseModel> expensesList;
      type = event.type;
      if (event.type == 1) {
        expensesList = await expenseRepository.getAll(
          DateTime.now(),
          DateTime.now(),
        );
      } else if (event.type == 2) {
        expensesList = await expenseRepository.getAll(
          DateTime.now().add(const Duration(days: -7)),
          DateTime.now(),
        );
      } else {
        expensesList = await expenseRepository.getAll(
          DateTime.now().add(const Duration(days: -30)),
          DateTime.now(),
        );
      }
      List<Color> colors = [];
      List<String> titles = [];
      List<double> totalCounts = [];
      double allCount = 0;
      if (expensesList.isNotEmpty) {
        for (var i = 0; i < expensesList.length; i++) {
          if (!titles.contains(expensesList[i].category?.name)) {
            titles.add(expensesList[i].category!.name!);
            colors.add(hexToColor(expensesList[i].category!.color!));
            totalCounts.add(expensesList[i].totalCount!);
          } else {
            totalCounts[titles.indexOf(expensesList[i].category!.name!)] +=
                expensesList[i].totalCount!;
          }
          allCount += expensesList[i].totalCount!;
        }
      }
      emit(
        DiagramState.initial(
          currency: curUser!.currency!,
          expensesList: expensesList,
          type: event.type,
          colors: colors,
          allCount: allCount,
          titles: titles,
          totalCounts: totalCounts,
        ),
      );
      oldState = DiagramState.initial(
        currency: curUser!.currency!,
        expensesList: expensesList,
        type: event.type,
        colors: colors,
        allCount: allCount,
        titles: titles,
        totalCounts: totalCounts,
      );
    } catch (ex) {
      emit(DiagramState.info(
        message: ex.toString(),
        pageState: PageState.error,
      ));
    }
  }
}
