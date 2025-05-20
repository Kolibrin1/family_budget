import 'package:family_budget/app/app_router/app_router.dart';
import 'package:family_budget/data/models/income_model.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/gen/strings.g.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.user, required this.incomes});

  final UserModel user;
  final List<IncomeModel> incomes;

  static var gradientColors = [
    AppColors.lightPrimary,
    AppColors.primary,
    AppColors.primary,
    AppColors.complementaryBlue,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      appBar: AppBar(
        title: Text(t.profile.profile, style: theme.textTheme.headlineLarge),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSettings01, color: AppColors.onSecondary),
          ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final notificationService = NotificationService();
          //     await notificationService.initNotifications();
          //     await notificationService.sendDelayedReminderNotification();
          //
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(
          //         content: Text('Уведомление будет отправлено через 10 секунд'),
          //         duration: Duration(seconds: 2),
          //       ),
          //     );
          //   },
          //   child: SvgPicture.asset('assets/icons/info.svg'),
          // ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      statusBarPadding: false,
      willPop: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              _buildBalanceRow(theme),
              const SizedBox(height: 25),
              _buildActionRow(context, t.profile.addExpensesBtn, ProfileInitExpenseEvent()),
              const SizedBox(height: 20),
              _buildActionRow(context, t.profile.addIncomesBtn, ProfileInitIncomeEvent()),
              const SizedBox(height: 18),
              Text(t.profile.incomes, style: theme.textTheme.titleMedium),
              const SizedBox(height: 20),
              _buildIncomesList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceRow(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          stops: const [0.0, 0.15, 0.38, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.profile.balance,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                user.login ?? '',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${user.balance}',
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                user.currency!,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context, String label, ProfileEvent event) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.read<ProfileBloc>().add(event),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline, size: 24, color: AppColors.lightPrimary),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(
              colors: gradientColors,
              stops: [0.0, 0.15, 0.38, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(label, style: theme.textTheme.titleMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomesList(BuildContext context) {
    final theme = Theme.of(context);
    return incomes.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: incomes
                  .map((income) => _buildIncomeRow(context, income))
                  .toList()
                  .separateBy(const SizedBox(height: 10)),
            ),
          )
        : Text(t.profile.noIncomes, style: theme.textTheme.titleMedium);
  }

  Widget _buildIncomeRow(BuildContext context, IncomeModel income) {
    final theme = Theme.of(context);
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
                    onPressed: (_) => context.read<ProfileBloc>().add(
                          ProfileInitIncomeEvent(income: income),
                        ),
                    backgroundColor: AppColors.complementaryBlue,
                    foregroundColor: Colors.white,
                    icon: SvgPicture.asset(
                      'assets/icons/edit_icon.svg',
                      height: 26,
                      width: 26,
                      color: getIconColor(color),
                    ),
                    label: t.profile.changeBtn,
                    padding: EdgeInsets.zero,
                  ),
                  SlidableAction(
                    onPressed: (ctx) => showConfirmDialog(
                      context: ctx,
                      title: t.profile.deletingIncome,
                      message: '${t.profile.youSureDeleteExpense}"${income.date?.formatNumberDate}"?',
                      item: income,
                      onConfirm: () => ctx.read<ProfileBloc>().add(
                            ProfileDeleteIncomeEvent(incomeId: income.id!),
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
                    label: t.profile.deleteBtn,
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
                          const SizedBox(width: 20),
                          Text(
                            '${income.category?.name}\n${income.totalCount} ${user.currency}',
                            style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.background),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          income.date!.formatColumnDate,
                          style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.background),
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
