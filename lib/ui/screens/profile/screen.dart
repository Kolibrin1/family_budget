import 'package:auto_route/annotations.dart';
import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc.dart';
import 'widgets/add_expense_body.dart';
import 'widgets/add_income_body.dart';
import 'widgets/profile_body.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => getIt<ProfileBloc>()
        ..add(
          ProfileEvent.initial(),
        ),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.mapOrNull(
            info: (info) {
              showMessage(
                message: info.message,
                type: info.pageState,
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () =>  AppScaffold(
              appBar: AppBar(
                title: const Text(
                  'Профиль',
                  style: TextStyle(fontSize: 20),
                ),
                centerTitle: true,
                backgroundColor: AppColors.background,
              ),
              statusBarPadding: false,
              willPop: false,
              child: LoadingGif(),
            ),
            initial: (user, incomesList) => ProfileBody(
              user: user,
              incomes: incomesList,
            ),
            addIncome: (income) => AddIncomeBody(),
            addExpense: (expense) => AddExpenseBody(),
            orElse: () => AppScaffold(
              appBar: AppBar(
                title: const Text(
                  'Профиль',
                  style: TextStyle(fontSize: 20),
                ),
                centerTitle: true,
                backgroundColor: AppColors.background,
              ),
              statusBarPadding: false,
              willPop: false,
              child: LoadingGif(),
            ),
          );
        },
      ),
    );
  }
}
