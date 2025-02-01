import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/ui/screens/calculator/bloc/calc_bloc.dart';
import 'package:family_budget/ui/screens/calculator/widgets/calculator_body.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
// @RoutePage()
// class CalculatorScreen extends StatefulWidget {
//   const CalculatorScreen({super.key});
//
//   @override
//   State<CalculatorScreen> createState() => _CalculatorScreenState();
// }
//
// class _CalculatorScreenState extends State<CalculatorScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CalculatorBloc>(
//       create: (context) => getIt<CalculatorBloc>()
//         ..add(
//           CalculatorEvent.initial(),
//         ),
//       child: BlocConsumer<CalculatorBloc, CalculatorState>(
//         listener: (context, state) {
//           state.mapOrNull(
//             info: (info) {
//               showMessage(
//                 message: info.message,
//                 type: info.pageState,
//               );
//             },
//           );
//         },
//         builder: (context, state) {
//           return state.maybeWhen(
//             loading: () => AppScaffold(
//               child: LoadingGif(),
//             ),
//             initial: (first, second, count, answer, searchText) =>
//                 CalculatorBody(
//               first: first,
//               second: second,
//               count: count,
//               searchText: searchText,
//               answer: answer,
//             ),
//             orElse: () => AppScaffold(
//               child: LoadingGif(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

@RoutePage()
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      create: (context) =>
          getIt<CalculatorBloc>()..add(CalculatorEvent.initial()),
      child: BlocConsumer<CalculatorBloc, CalculatorState>(
        listener: (context, state) {
          state.mapOrNull(
            info: (info) {
              showMessage(message: info.message, type: info.pageState);
            },
          );
        },
        builder: (context, state) {
          // Получаем старые данные для сохранения UI при загрузке
          final oldState = context.read<CalculatorBloc>().oldState.maybeWhen(
                initial: (first, second, count, answer, searchText) =>
                    (first, second, count, answer, searchText),
                orElse: () => (null, null, null, null, null),
              );

          return CalculatorBody(
            first: oldState.$1,
            second: oldState.$2,
            count: oldState.$3,
            answer: oldState.$4,
            searchText: oldState.$5,
            isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
          );

          // // Берем данные из текущего состояния
          // final newState = state.maybeWhen(
          //   initial: (first, second, count, answer, searchText) =>
          //   (first, second, count, answer, searchText),
          //   orElse: () => null,
          // );
          //
          // // Если текущее состояние пустое, используем старое
          // final oldState = context.read<CalculatorBloc>().oldState.maybeWhen(
          //   initial: (first, second, count, answer, searchText) =>
          //   (first, second, count, answer, searchText),
          //   orElse: () => (null, null, null, null, null),
          // );
          //
          // // Выбираем между новым и старым состоянием
          // final currentState = newState ?? oldState;
          //
          // return CalculatorBody(
          //   first: currentState.$1,
          //   second: currentState.$2,
          //   count: currentState.$3,
          //   answer: currentState.$4,
          //   searchText: currentState.$5,
          //   isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
          // );
        },
      ),
    );
  }
}
