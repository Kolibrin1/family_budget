import 'package:auto_route/auto_route.dart';
import 'package:family_budget/app/app_router/app_router.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/navigator/bottom_navigation_bar.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  static const List<PageRouteInfo> _routes = [
    DiagramRoute(),
    CalculatorRoute(),
    ProfileRoute(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      context.router.replace(_routes[index]); // Переключаем экран
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (context, child) {
        return RootScaffold(
          child: child,
        );
      },
    );
  }
}
