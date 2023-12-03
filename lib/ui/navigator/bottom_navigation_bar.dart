import 'package:auto_route/auto_route.dart';
import 'package:family_budget/app/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/app_colors.dart';
import 'cubit/navigator_cubit.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 0,
            offset: const Offset(0, -0.5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: context.watch<NavigationCubit>().state,
        type: BottomNavigationBarType.fixed,
        onTap: (i) async {
          final routesPerNavBarButton = [
            const DiagramRoute(),
            const CalculatorRoute(),
            const ProfileRoute(),
          ];
          context.router.replaceAll([routesPerNavBarButton[i]]);
          context.read<NavigationCubit>().updateIndex(i);
        },
        unselectedLabelStyle: TextStyle(
          color: AppColors.colorScheme.primary,
        ),
        unselectedItemColor: AppColors.colorScheme.primary,
        fixedColor: AppColors.colorScheme.secondary,
        items: [
          BottomNavigationBarItem(
            label: 'Диаграмма',
            icon: context.watch<NavigationCubit>().state == 0
                ? SvgPicture.asset(
                    'assets/icons/diagram.svg',
                    height: 35,
                    color: AppColors.colorScheme.onSecondary,
                  )
                : SvgPicture.asset(
                    'assets/icons/diagram.svg',
                    height: 35,
                    color: AppColors.colorScheme.primary,
                  ),
            activeIcon: SvgPicture.asset(
              'assets/icons/diagram.svg',
              height: 35,
              color: AppColors.colorScheme.onSecondary,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Калькулятор',
            icon: context.watch<NavigationCubit>().state == 1
                ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/icons/calculator.svg',
                        color: AppColors.colorScheme.onSecondary,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/icons/calculator.svg',
                        color: AppColors.colorScheme.primary,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
            activeIcon: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                SvgPicture.asset(
                  'assets/icons/calculator.svg',
                  color: AppColors.colorScheme.onSecondary,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: context.watch<NavigationCubit>().state == 2
                ? SvgPicture.asset(
                    'assets/icons/profile.svg',
                    height: 35,
                    color: AppColors.colorScheme.onSecondary,
                  )
                : SvgPicture.asset(
                    'assets/icons/profile.svg',
                    height: 35,
                    color: AppColors.colorScheme.primary,
                  ),
            activeIcon: SvgPicture.asset(
              'assets/icons/profile.svg',
              height: 35,
              color: AppColors.colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
