import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@injectableInit
FutureOr<void> initDependencies(String? environment) =>
    getIt.init(environment: environment);

@module
abstract class AppModule {
  @preResolve
  @singleton
  @dev
  Future<SharedPreferences> prefs() => SharedPreferences.getInstance();
}
