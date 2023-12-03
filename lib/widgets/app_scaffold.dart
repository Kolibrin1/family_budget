import 'package:family_budget/ui/navigator/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.appBar,
    this.willPop = true,
    this.statusBarPadding = true,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    required this.child,
  }) : super(key: key);

  final AppBar? appBar;
  final Widget child;
  final bool willPop;
  final bool statusBarPadding;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return willPop;
      },
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: const AppBottomNavigationBar(),
        body: Padding(
          padding: EdgeInsets.only(
            top: statusBarPadding
                ? (MediaQuery.of(context).viewPadding.top + verticalPadding)
                : verticalPadding,
            bottom: verticalPadding,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
