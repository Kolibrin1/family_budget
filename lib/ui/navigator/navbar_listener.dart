import 'package:auto_route/auto_route.dart';
import 'package:family_budget/app/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../app/di/di.dart';
import 'cubit/navigator_cubit.dart';

@lazySingleton
class NavBarRoutesObserver extends AutoRouterObserver {
  NavBarRoutesObserver();
  final navCubit = getIt<NavigationCubit>();

  @override
  void didPush(route, previousRoute) => _syncNavBar(route);

  @override
  void didPop(route, previousRoute) => _syncNavBar(previousRoute);

  @override
  void didReplace({newRoute, oldRoute}) => _syncNavBar(newRoute);

  void _syncNavBar(Route? route) {
    Future.microtask(() {
      switch (route?.settings.name) {
        case DiagramRoute.name:
          navCubit.getDiagram();
          break;
        case CalculatorRoute.name:
          navCubit.getCalculator();
          break;
        case ProfileRoute.name:
          navCubit.getProfile();
          break;
      }
    });
  }
}
