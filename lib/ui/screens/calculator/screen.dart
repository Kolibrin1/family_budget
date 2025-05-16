import 'package:auto_route/annotations.dart';
import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/ui/screens/calculator/bloc/calc_bloc.dart';
import 'package:family_budget/ui/screens/calculator/widgets/calculator_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      create: (_) => getIt<CalculatorBloc>()..add(CalculatorInitEvent()),
      child: BlocConsumer<CalculatorBloc, CalculatorState>(
        listenWhen: (prev, cur) => cur is CalculatorInfoState,
        listener: (context, state) {
          final info = state as CalculatorInfoState;
          showMessage(message: info.message, type: info.pageState);
        },
        builder: (context, state) {
          return CalculatorBody(
            oldState: switch (context.read<CalculatorBloc>().oldState) {
              CalculatorInitState s => s,
              _ => null,
            },
            isLoading: switch (context.read<CalculatorBloc>().oldState) {
              CalculatorLoadingState _ => true,
              _ => false,
            },
          );
        },
      ),
    );
  }
}
