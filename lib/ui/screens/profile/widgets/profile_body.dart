import 'package:family_budget/data/models/income_model.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:family_budget/ui/screens/profile/widgets/add_expense_dialog.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_income_dialog.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.user, required this.incomes});

  final UserModel user;
  final List<IncomeModel> incomes;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/pig_and_coin.svg',
                    height: 36,
                    width: 3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Баланс: ',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    user.balance.toString(),
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    user.currency!,
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  showAddExpenseDialog(
                    context: context,
                    dialogTitle: 'Добавление расходов',
                    onTap: (title, date, totalCount) {
                      context.read<ProfileBloc>().add(
                            ProfileEvent.addExpense(
                              title: title,
                              totalCount: totalCount,
                              date: date,
                            ),
                          );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 24,
                      color: AppColors.colorScheme.secondary,
                    ),
                    Text(
                      'Добавить расходы',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  showAddIncomeDialog(
                    context: context,
                    dialogTitle: 'Добавление доходов',
                    onTap: (title, date, totalCount) {
                      context.read<ProfileBloc>().add(
                            ProfileEvent.addIncome(
                              title: title,
                              totalCount: totalCount,
                              date: date,
                            ),
                          );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 24,
                      color: AppColors.colorScheme.secondary,
                    ),
                    Text(
                      'Добавить доходы',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Доходы',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              incomes.isNotEmpty
                  ? Expanded(
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                incomes.length,
                                (index) => SizedBox(
                                  child: getRowIncome(
                                    IncomeModel(
                                      date: incomes[index].date,
                                      totalCount: incomes[index].totalCount,
                                      title: incomes[index].title,
                                    ),
                                    context,
                                    user,
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
                  : const Text('Доходов пока не было'),
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
  UserModel user,
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
                  "${income.title} - ${income.totalCount} ${user.currency}",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.text,
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
