import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/ui/screens/calculator/bloc/calc_bloc.dart';
import 'package:family_budget/ui/screens/calculator/widgets/calculator_body.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      create: (context) => getIt<CalculatorBloc>()
        ..add(
          CalculatorEvent.initial(),
        ),
      child: BlocConsumer<CalculatorBloc, CalculatorState>(
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
            initial: (first, second, count, answer, searchText) =>
                CalculatorBody(
              first: first,
              second: second,
              count: count,
              searchText: searchText,
              answer: answer,
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
