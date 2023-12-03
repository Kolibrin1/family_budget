import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../gen/assets.gen.dart';
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

  @preResolve
  @dev
  @singleton
  Future<DotEnv> dotEnvTest() async {
    await dotenv.load(fileName: Assets.env.dev);
    return dotenv;
  }
}
