import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/data/models/income_model.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/strings.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/diagram/bloc/diagram_bloc.dart';
import 'package:family_budget/ui/screens/diagram/widgets/description_bottom_sheet.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class DiagramBody extends StatefulWidget {
  const DiagramBody({
    super.key,
    required this.expenses,
    required this.currency,
    required this.type,
    required this.colors,
    required this.titles,
    required this.totalCounts,
    required this.allCount,
  });

  final List<ExpenseModel> expenses;
  final String currency;
  final int type;
  final List<Color> colors;
  final List<String> titles;
  final List<double> totalCounts;
  final double allCount;

  @override
  State<DiagramBody> createState() => _DiagramBodyState();
}

class _DiagramBodyState extends State<DiagramBody> {
  int type = 1;

  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Анализ расходов'),
        centerTitle: true,
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                showDescriptionBottomSheet(context, widget.colors, widget.titles, widget.totalCounts, widget.allCount);
              },
              child: SvgPicture.asset(
                'assets/icons/info.svg',
                color: AppColors.colorScheme.primary,
              ),
            ),
          )
        ],
      ),
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppWeekStrings.strings[9],
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Данные за:',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        type = 1;
                      });
                      context.read<DiagramBloc>().add(
                            const DiagramEvent.selectTypeView(
                              type: 1,
                            ),
                          );
                    },
                    child: Text(
                      'Неделю',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: type == 1 ? AppColors.colorScheme.secondary : Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        type = 2;
                      });
                      context.read<DiagramBloc>().add(
                            const DiagramEvent.selectTypeView(
                              type: 2,
                            ),
                          );
                    },
                    child: Text(
                      'Месяц',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: type == 2 ? AppColors.colorScheme.secondary : Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        type = 3;
                      });
                      context.read<DiagramBloc>().add(
                            const DiagramEvent.selectTypeView(
                              type: 3,
                            ),
                          );
                    },
                    child: Text(
                      'Год        ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: type == 3 ? AppColors.colorScheme.secondary : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 20,
                    borderData: FlBorderData(show: false),
                    sections: [
                      ...List.generate(
                        widget.colors.length,
                        (index) => PieChartSectionData(
                          value: widget.totalCounts[index],
                          color: widget.colors[index],
                          radius: 85,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Список расходов',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
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
                                  child: getRowIncome(
                                    IncomeModel(
                                      date: widget.expenses[index].date,
                                      totalCount: widget.expenses[index].totalCount,
                                      title: widget.expenses[index].title,
                                    ),
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
                  : const Text('Расходов пока не было'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getRowIncome(
  IncomeModel income,
  BuildContext context,
  String currency,
  List<Color> colors,
  List<String> titles,
) {
  return Material(
    elevation: 0.3,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          10,
        ),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 49,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/coin_dollar.svg',
                  color: AppColors.checkStatus,
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  "${income.title} - ${income.totalCount} $currency",
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: colors[titles.indexOf(income.title!)],
              ),
              height: 30,
              width: 60,
              child: Center(
                child: Text(
                  income.date!.formatNumberDate,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
