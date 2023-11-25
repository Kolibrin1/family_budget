import 'package:auto_route/auto_route.dart';
import 'package:family_budget/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

BuildContext get globalContext => _navKey.currentContext!;
final _navKey = GlobalKey<NavigatorState>();

@injectable
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter()
      : super(navigatorKey: _navKey);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page),
  ];
}
