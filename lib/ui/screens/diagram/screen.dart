import 'package:auto_route/annotations.dart';
import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/diagram_bloc.dart';
import 'widgets/diagram_body.dart';

@RoutePage()
class DiagramScreen extends StatelessWidget {
  const DiagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiagramBloc>(
      create: (context) => getIt<DiagramBloc>()
        ..add(
          DiagramEvent.initial(),
        ),
      child: BlocConsumer<DiagramBloc, DiagramState>(
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
            loading: () => const AppScaffold(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            initial: (currency, expensesList, type, colors, titles, totalCounts, allCount) => DiagramBody(
              currency: currency,
              expenses: expensesList,
              type: type,
              colors: colors,
              titles: titles,
              totalCounts: totalCounts,
              allCount: allCount,
            ),
            orElse: () => const AppScaffold(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
