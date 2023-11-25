// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:family_budget/app/app_router/app_router.dart' as _i3;
import 'package:family_budget/app/di/di.dart' as _i10;
import 'package:family_budget/data/api_client.dart' as _i6;
import 'package:family_budget/data/api_service.dart' as _i8;
import 'package:family_budget/data/repositories/currency_repository.dart'
    as _i9;
import 'package:family_budget/helpers/preferences.dart' as _i5;
import 'package:flutter_dotenv/flutter_dotenv.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AppRouter>(() => _i3.AppRouter());
    await gh.singletonAsync<_i4.SharedPreferences>(
      () => appModule.prefs(),
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i5.Preferences>(
        () => _i5.Preferences(gh<_i4.SharedPreferences>()));
    gh.lazySingleton<_i6.ApiClient>(() => _i6.ApiClient(
          gh<_i5.Preferences>(),
          gh<_i7.DotEnv>(),
        ));
    gh.lazySingleton<_i8.ApiService>(() => _i8.ApiService(gh<_i6.ApiClient>()));
    gh.singleton<_i9.CurrencyRepository>(
        _i9.CurrencyRepository(gh<_i8.ApiService>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
