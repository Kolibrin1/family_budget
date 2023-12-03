import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app_router/app_router.dart';
import 'app/di/di.dart';
import 'helpers/preferences.dart';
import 'styles/app_theme.dart';
import 'ui/navigator/cubit/navigator_cubit.dart';
import 'ui/navigator/navbar_listener.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = getIt<AppRouter>();
  final Preferences prefs = getIt<Preferences>();

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void dispose() {
    appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = appRouter.config(
      navigatorObservers: () => [
        getIt<NavBarRoutesObserver>(),
      ],
    );

    return BlocProvider(
      create: (context) => getIt<NavigationCubit>(),
      child: MaterialApp.router(
        checkerboardOffscreenLayers: false,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        routerConfig: config,
      ),
    );
  }
}
