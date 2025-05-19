import 'package:family_budget/data/models/analytics_model.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/diagram/bloc/diagram_bloc.dart';
import 'package:family_budget/ui/screens/diagram/widgets/category_analytics_bottom_sheet.dart';
import 'package:family_budget/widgets/confirm_dialog.dart';
import 'package:family_budget/widgets/custom_slider_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart' hide SlidableAction;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fl_chart/fl_chart.dart';

class DiagramBody extends StatelessWidget {
  const DiagramBody({
    super.key,
    required this.expenses,
    required this.currency,
    required this.analyticsData,
  });

  final List<ExpenseModel> expenses;
  final String currency;
  final AnalyticsData analyticsData;

  @override
  Widget build(BuildContext context) {
    final countColors = analyticsData.colors.length;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 20,
                    startDegreeOffset: 270,
                    sections: List.generate(
                      analyticsData.colors.length,
                      (i) {
                        final fontSize = 14.0;
                        final radius = 80.0;
                        return PieChartSectionData(
                          color: analyticsData.colors[i],
                          value: analyticsData.totalCounts[i],
                          title: '${analyticsData.totalCounts[i].toStringAsFixed(0)} $currency',
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: getIconColor(analyticsData.colors[i]),
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                color: analyticsData.colors[i].withOpacity(0.5),
                                offset: const Offset(1, 1),
                              ),
                            ],
                          ),
                          badgeWidget: analyticsData.totalCounts[i] / analyticsData.allCount > 0.08
                              ? Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: analyticsData.colors[i].withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    analyticsData.titles[i],
                                    style: TextStyle(
                                      color: getIconColor(analyticsData.colors[i]),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : null,
                          badgePositionPercentageOffset: 1.2,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          if (analyticsData.colors.isNotEmpty) ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: countColors <= 8
                    ? 40
                    : countColors <= 14
                        ? 80
                        : 120,
                child: StaggeredGrid.count(
                  crossAxisCount: countColors <= 8
                      ? 1
                      : countColors <= 14
                          ? 2
                          : 3,
                  axisDirection: AxisDirection.right,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 4,
                  children: List.generate(analyticsData.colors.length, (i) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => CategoryAnalyticsBottomSheet(
                            categoryName: analyticsData.titles[i],
                            categoryColor: analyticsData.colors[i],
                            categoryId: analyticsData.categoryIds[i],
                            currency: currency,
                            icon: analyticsData.icons[i],
                          ),
                        );
                      },
                      child: Chip(
                        backgroundColor: analyticsData.colors[i].withOpacity(0.2),
                        side: BorderSide(color: analyticsData.colors[i], width: 1),
                        avatar: CircleAvatar(
                          backgroundColor: analyticsData.colors[i],
                          radius: 8,
                        ),
                        label: Text(
                          analyticsData.titles[i],
                          style: TextStyle(
                            color: AppColors.background,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
          if (expenses.isNotEmpty) ...[
            Text(
              'Список расходов',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
          ],
          Expanded(
            child: expenses.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: expenses
                          .map((expense) => _buildExpenseRow(context, expense))
                          .toList()
                          .separateBy(const SizedBox(height: 10)),
                    ),
                  )
                : Text(
                    'Расходов пока не было',
                    style: theme.textTheme.titleMedium,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseRow(BuildContext context, ExpenseModel expense) {
    final color = hexToColor(expense.category?.color ?? '');
    final categoryIndex = analyticsData.titles.indexOf(expense.category?.name ?? '');
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.primary.withOpacity(0.8),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ]),
      child: Stack(
        children: [
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
            child: Slidable(
              closeOnScroll: false,
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                extentRatio: 0.40,
                children: [
                  SlidableAction(
                    onPressed: (_) => context.read<DiagramBloc>().add(
                          DiagramInitEditExpenseEvent(expense: expense),
                        ),
                    backgroundColor: AppColors.complementaryBlue,
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
                    onPressed: (ctx) => showConfirmDialog(
                      context: ctx,
                      title: 'Удаление расхода',
                      message: 'Вы точно хотите удалить расход от "${expense.date?.formatNumberDate}"?',
                      item: expense,
                      onConfirm: () => ctx.read<DiagramBloc>().add(
                            DiagramDeleteExpenseEvent(expenseId: expense.id!),
                          ),
                    ),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.onSecondary.withOpacity(0.98),
                  ),
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
                              color: analyticsData.colors[categoryIndex],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                expense.category?.icon ?? '',
                                height: 30,
                                width: 30,
                                color: getIconColor(analyticsData.colors[categoryIndex]),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '${expense.category?.name}\n${expense.totalCount} $currency',
                            style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.background),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          expense.date!.formatColumnDate,
                          style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.background),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
