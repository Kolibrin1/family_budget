import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app_router/app_router.dart';
import 'app/di/di.dart';
import 'data/bloc_categories/categories_cubit.dart';
import 'gen/strings.g.dart';
import 'helpers/preferences.dart';
import 'styles/app_theme.dart';
import 'ui/navigator/cubit/navigator_cubit.dart';
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
    // Загрузка сохраненной локали при запуске приложения
    prefs.getLocale();
    super.initState();
  }

  @override
  void dispose() {
    appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getIt.get<Preferences>().getLocale();
    final config = appRouter.config(
        // navigatorObservers: () => [
        //   getIt<NavBarRoutesObserver>(),
        // ],
        );
    // Оборачиваем все приложение в TranslationProvider для обновления UI при смене языка
    return TranslationProvider(
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<CategoriesCubit>()),
              BlocProvider(
                create: (context) => getIt<NavigationCubit>(),
              ),
            ],
            child: MaterialApp.router(
              checkerboardOffscreenLayers: false,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              routerConfig: config,
              supportedLocales: AppLocaleUtils.supportedLocales,
              locale: TranslationProvider.of(context).flutterLocale,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            ),
          );
        },
      ),
    );
  }
}
