import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/data/repositories/category_repository.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fl_chart/fl_chart.dart';

class CategoryAnalyticsBottomSheet extends StatefulWidget {
  final String categoryName;
  final Color categoryColor;
  final int categoryId;
  final String currency;
  final String icon;

  const CategoryAnalyticsBottomSheet({
    super.key,
    required this.categoryName,
    required this.categoryColor,
    required this.categoryId,
    required this.currency,
    required this.icon,
  });

  @override
  State<CategoryAnalyticsBottomSheet> createState() => _CategoryAnalyticsBottomSheetState();
}

class _CategoryAnalyticsBottomSheetState extends State<CategoryAnalyticsBottomSheet> {
  final _categoryRepository = getIt<CategoryRepository>();
  String _selectedTimeSegment = 'days';
  List<double> _statistics = [];
  List<ExpenseModel> _recentExpenses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final statistics = await _categoryRepository.getCategoryStatistics(
        widget.categoryId,
        _selectedTimeSegment,
      );
      final recentExpenses = await _categoryRepository.getRecentCategoryExpenses(
        widget.categoryId,
      );
      setState(() {
        _statistics = statistics;
        _recentExpenses = recentExpenses;
      });
    } catch (e) {
      // TODO: Обработка ошибок
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _changeTimeSegment(String segment) async {
    setState(() {
      _selectedTimeSegment = segment;
      _isLoading = true;
    });
    await _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxHeight = MediaQuery.of(context).size.height * 0.8;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.onSecondary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 15, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: widget.categoryColor,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              widget.icon,
                              height: 30,
                              width: 30,
                              color: getIconColor(widget.categoryColor),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            widget.categoryName,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: AppColors.onSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Статистика расходов',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: AppColors.onSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTimeSegmentSelector(),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: _isLoading ? const Center(child: CircularProgressIndicator()) : _buildStatisticsChart(),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Последние транзакции',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: AppColors.onSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: _isLoading ? const Center(child: CircularProgressIndicator()) : _buildRecentExpensesList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSegmentSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTimeSegmentRadio('days', 'Дни'),
        _buildTimeSegmentRadio('weeks', 'Недели'),
        _buildTimeSegmentRadio('months', 'Месяцы'),
      ],
    );
  }

  Widget _buildTimeSegmentRadio(String value, String label) {
    final isSelected = _selectedTimeSegment == value;

    return InkWell(
      onTap: () => _changeTimeSegment(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? widget.categoryColor : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: widget.categoryColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? getIconColor(widget.categoryColor) : AppColors.onSecondary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: _statistics.isEmpty ? 0 : _statistics.reduce((a, b) => a > b ? a : b) * 1.2,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value < 0 || value >= _statistics.length) {
                  return const Text('');
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${_statistics[value.toInt()].toStringAsFixed(0)} ${widget.currency}',
                    style: const TextStyle(
                      color: AppColors.onSecondary,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
              reservedSize: 30,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value < 0 || value >= _statistics.length) {
                  return const Text('');
                }
                return Text(
                  '${_statistics[value.toInt()].toStringAsFixed(0)} ${widget.currency}',
                  style: const TextStyle(
                    color: AppColors.onSecondary,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              reservedSize: 10,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        barGroups: List.generate(
          _statistics.length,
          (i) => BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: _statistics[i] + 1,
                color: widget.categoryColor,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [widget.categoryColor.withOpacity(0.05), widget.categoryColor.withOpacity(0.3), widget.categoryColor],
                ),
                width: 22,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentExpensesList() {
    if (_recentExpenses.isEmpty) {
      return Center(
        child: Text(
          'Нет транзакций',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.onSecondary,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: _recentExpenses.length,
      itemBuilder: (context, index) {
        final expense = _recentExpenses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: widget.categoryColor.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                expense.date?.formatColumnDate ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSecondary,
                    ),
              ),
              Text(
                '${expense.totalCount} ${widget.currency}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: widget.categoryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
