import 'package:family_budget/data/bloc_categories/categories_cubit.dart';
import 'package:family_budget/data/models/income_model.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/confirm_dialog.dart';
import 'package:family_budget/widgets/custom_slider_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart' hide SlidableAction;
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.user, required this.incomes});

  final UserModel user;
  final List<IncomeModel> incomes;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      statusBarPadding: false,
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                '${user.login}',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/balance_icon.svg',
                    height: 36,
                    width: 3,
                    // color: AppColors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Баланс: ',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    user.balance.toString(),
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    user.currency!,
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  context.read<ProfileBloc>().add(
                        ProfileEvent.initExpense(),
                      );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 24,
                      color: AppColors.lightPrimary,
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          AppColors.lightPrimary,
                          AppColors.primary,
                          AppColors.primary,
                          AppColors.complementaryBlue
                        ],
                        stops: [0.0, 0.15, 0.38, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'Добавить расходы',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorScheme.primary,
                        ),
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
                  context.read<ProfileBloc>().add(
                        ProfileEvent.initIncome(),
                      );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 24,
                      color: AppColors.lightPrimary,
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          AppColors.lightPrimary,
                          AppColors.primary,
                          AppColors.primary,
                          AppColors.complementaryBlue
                        ],
                        stops: [0.0, 0.15, 0.38, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'Добавить доходы',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorScheme.primary,
                        ),
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
                  color: AppColors.white,
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
                                      category: incomes[index].category,
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
                  : Text(
                      'Доходов пока не было',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
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
  final color = hexToColor(income.category?.color ?? '');
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
          borderRadius: BorderRadius.circular(10), // Обрезаем границы Slidable
          child: Slidable(
            closeOnScroll: false,
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              extentRatio: 0.40,
              children: [
                SlidableAction(
                  spacing: 0,
                  onPressed: (ctx) {
                    ctx.read<ProfileBloc>().add(
                      ProfileEvent.initIncome(income: income),
                    );
                  },
                  backgroundColor: AppColors.complementaryBlue, // Совпадает с задним фоном
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
                      title: "Удаление дохода",
                      message: "Вы точно хотите удалить доход от\"${income.date?.formatNumberDate}\"?",
                      onConfirm: () {
                        ctx.read<ProfileBloc>().add(
                          ProfileEvent.deleteIncome(incomeId: income.id!),
                        );
                      },
                    );
                  },
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  icon:  SvgPicture.asset(
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
              color: Colors.transparent,
              elevation: 0.3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
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
                              color: color,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                income.category?.icon ?? '',
                                height: 30,
                                width: 30,
                                color: getIconColor(color),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${income.category?.name}\n${income.totalCount} ${user.currency}",
                            style: GoogleFonts.inter(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          income.date!.formatColumnDate,
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
