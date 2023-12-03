import 'package:auto_route/auto_route.dart';
import 'package:family_budget/ui/screens/auth/screen.dart';
import 'package:family_budget/ui/screens/calculator/screen.dart';
import 'package:family_budget/ui/screens/diagram/screen.dart';
import 'package:family_budget/ui/screens/profile/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'auth_guard.dart';

part 'app_router.gr.dart';

BuildContext get globalContext => _navKey.currentContext!;
final _navKey = GlobalKey<NavigatorState>();

@injectable
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter(this._authGuard) : super(navigatorKey: _navKey);
  final AuthGuard _authGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
        ),
        AutoRoute(
          page: DiagramRoute.page,
          guards: [_authGuard],
          initial: true,
        ),
        AutoRoute(
          page: CalculatorRoute.page,
        ),
        AutoRoute(
          page: ProfileRoute.page,
          guards: [_authGuard]
        ),
      ];
}
