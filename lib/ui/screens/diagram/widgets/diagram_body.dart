import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/diagram/bloc/diagram_bloc.dart';
import 'package:family_budget/widgets/confirm_dialog.dart';
import 'package:family_budget/widgets/custom_slider_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart' hide SlidableAction;
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class DiagramBody extends StatefulWidget {
  const DiagramBody({
    super.key,
    required this.expenses,
    required this.currency,
    required this.colors,
    required this.titles,
    required this.totalCounts,
    required this.allCount,
  });

  final List<ExpenseModel> expenses;
  final String currency;
  final List<Color> colors;
  final List<String> titles;
  final List<double> totalCounts;
  final double allCount;

  @override
  State<DiagramBody> createState() => _DiagramBodyState();
}

class _DiagramBodyState extends State<DiagramBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 220,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 20,
                borderData: FlBorderData(show: false),
                sections: [
                  ...List.generate(
                    widget.colors.length,
                    (index) => PieChartSectionData(
                      value: widget.totalCounts[index],
                      titleStyle:
                          TextStyle(color: getIconColor(widget.colors[index])),
                      color: widget.colors[index],
                      radius: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.expenses.isNotEmpty)
            Text(
              'Список расходов',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          widget.expenses.isNotEmpty
              ? Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            widget.expenses.length,
                            (index) => SizedBox(
                              child: getRowExpense(
                                widget.expenses[index],
                                context,
                                widget.currency,
                                widget.colors,
                                widget.titles,
                              ),
                            ),
                          ),
                        ].separateBy(
                          const SizedBox(
                            height: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Text(
                  'Расходов пока не было',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
        ],
      ),
    );
  }
}

Widget getRowExpense(
  ExpenseModel expense,
  BuildContext context,
  String currency,
  List<Color> colors,
  List<String> titles,
) {
  final color = hexToColor(expense.category?.color ?? '');
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withOpacity(0.8),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Stack(
      children: [
        // Фоновый контейнер (цвет первого экшена)
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 49,
            width: double.infinity,
            color: AppColors.complementaryBlue,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          // Обрезаем границы Slidable
          child: Slidable(
            closeOnScroll: false,
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              extentRatio: 0.40,
              children: [
                SlidableAction(
                  spacing: 0,
                  onPressed: (ctx) {
                    ctx.read<DiagramBloc>().add(
                      DiagramEvent.initEditExpense(expense: expense),
                    );
                  },
                  backgroundColor: AppColors.complementaryBlue,
                  // Совпадает с задним фоном
                  foregroundColor: Colors.white,
                  icon: SvgPicture.asset(
                    'assets/icons/edit_icon.svg',
                    height: 26,
                    width: 26,
                    color: getIconColor(color),
                  ),
                  label: 'Изменить',
                  padding: EdgeInsets.zero,
                ),
                SlidableAction(
                  spacing: 0,
                  onPressed: (ctx) {
                    showConfirmDialog(
                      context: ctx,
                      title: "Удаление расхода",
                      message: "Вы точно хотите удалить расход от\"${expense.date?.formatNumberDate}\"?",
                      onConfirm: () {
                        context.read<DiagramBloc>().add(
                          DiagramEvent.deleteExpense(expenseId: expense.id!),
                        );
                      },
                    );
                  },
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  icon: SvgPicture.asset(
                    'assets/icons/delete_icon.svg',
                    height: 26,
                    width: 26,
                    color: getIconColor(color),
                  ),
                  label: 'Удалить',
                  padding: EdgeInsets.zero,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ],
            ),
            child: Material(
              elevation: 0.3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: MediaQuery.of(context).size.width,
                height: 49,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.onSecondary.withOpacity(0.98),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colors[
                                  titles.indexOf(expense.category?.name ?? '')],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                expense.category?.icon ?? '',
                                height: 30,
                                width: 30,
                                color: getIconColor(colors[titles
                                    .indexOf(expense.category?.name ?? '')]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${expense.category?.name}\n${expense.totalCount} $currency",
                            style: GoogleFonts.inter(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          expense.date!.formatColumnDate,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.background,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
