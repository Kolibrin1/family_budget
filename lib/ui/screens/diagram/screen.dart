import 'package:auto_route/annotations.dart';
import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/profile/widgets/add_expense_body.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/diagram_bloc.dart';
import 'widgets/description_bottom_sheet.dart';
import 'widgets/diagram_body.dart';

@RoutePage()
class DiagramScreen extends StatelessWidget {
  const DiagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiagramBloc>(
      create: (context) => getIt<DiagramBloc>()..add(DiagramEvent.initial()),
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
            editExpense: (expense) => AddExpenseBody(
              expense: expense,
            ),
            orElse: () => AppScaffold(
              appBar: AppBar(
                title: const Text(
                  'Анализ расходов',
                  style: TextStyle(fontSize: 20),
                ),
                centerTitle: true,
                backgroundColor: AppColors.background,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        final bodyState = context.read<DiagramBloc>().state;
                        bodyState.maybeWhen(
                          initial: (currency, expensesList, type, colors,
                              titles, totalCounts, allCount) {
                            showDescriptionBottomSheet(
                              context,
                              colors,
                              titles,
                              totalCounts,
                              allCount,
                            );
                          },
                          orElse: () {},
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/icons/info.svg',
                        color: AppColors.colorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
              statusBarPadding: false,
              willPop: false,
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Text(
                    'Данные за:',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _FilterSelection(
                    selectedType: context.read<DiagramBloc>().type,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<DiagramBloc, DiagramState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => LoadingGif(),
                          initial: (currency, expensesList, type, colors,
                                  titles, totalCounts, allCount) =>
                              DiagramBody(
                            currency: currency,
                            expenses: expensesList,
                            colors: colors,
                            titles: titles,
                            totalCounts: totalCounts,
                            allCount: allCount,
                          ),
                          orElse: () => LoadingGif(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Виджет выбора периода (День/Неделя/Месяц)
class _FilterSelection extends StatefulWidget {
  const _FilterSelection({super.key, required this.selectedType});

  final int selectedType;

  @override
  State<_FilterSelection> createState() => _FilterSelectionState();
}

class _FilterSelectionState extends State<_FilterSelection> {
  int selectedType = 1;

  @override
  void initState() {
    selectedType = widget.selectedType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 14),
        _filterOption('День  ', 1),
        _filterOption('Неделю', 2),
        _filterOption('Период', 3),
        const SizedBox(width: 1),
      ],
    );
  }

  Widget _filterOption(String label, int type) {
    return InkWell(
      onTap: () {
        setState(() => selectedType = type);
        context
            .read<DiagramBloc>()
            .add(DiagramEvent.selectTypeView(type: type));
      },
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: selectedType == type
              ? AppColors.colorScheme.primary
              : AppColors.white,
        ),
      ),
    );
  }
}
