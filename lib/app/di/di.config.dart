// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:family_budget/app/app_router/app_router.dart' as _i15;
import 'package:family_budget/app/app_router/auth_guard.dart' as _i10;
import 'package:family_budget/app/di/di.dart' as _i20;
import 'package:family_budget/data/api_client.dart' as _i8;
import 'package:family_budget/data/api_service.dart' as _i9;
import 'package:family_budget/data/repositories/currency_repository.dart'
    as _i11;
import 'package:family_budget/data/repositories/expense_repository.dart'
    as _i12;
import 'package:family_budget/data/repositories/income_repository.dart' as _i13;
import 'package:family_budget/data/repositories/user_repository.dart' as _i14;
import 'package:family_budget/helpers/preferences.dart' as _i7;
import 'package:family_budget/ui/navigator/cubit/navigator_cubit.dart' as _i5;
import 'package:family_budget/ui/navigator/navbar_listener.dart' as _i4;
import 'package:family_budget/ui/screens/auth/bloc/auth_bloc.dart' as _i16;
import 'package:family_budget/ui/screens/calculator/bloc/calc_bloc.dart'
    as _i17;
import 'package:family_budget/ui/screens/diagram/bloc/diagram_bloc.dart'
    as _i18;
import 'package:family_budget/ui/screens/profile/bloc/profile_bloc.dart'
    as _i19;
import 'package:flutter_dotenv/flutter_dotenv.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    await gh.singletonAsync<_i3.DotEnv>(
      () => appModule.dotEnvTest(),
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i4.NavBarRoutesObserver>(
        () => _i4.NavBarRoutesObserver());
    gh.singleton<_i5.NavigationCubit>(_i5.NavigationCubit());
    await gh.singletonAsync<_i6.SharedPreferences>(
      () => appModule.prefs(),
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i7.Preferences>(
        () => _i7.Preferences(gh<_i6.SharedPreferences>()));
    gh.lazySingleton<_i8.ApiClient>(() => _i8.ApiClient(
          gh<_i7.Preferences>(),
          gh<_i3.DotEnv>(),
        ));
    gh.lazySingleton<_i9.ApiService>(() => _i9.ApiService(gh<_i8.ApiClient>()));
    gh.factory<_i10.AuthGuard>(() => _i10.AuthGuard(gh<_i7.Preferences>()));
    gh.lazySingleton<_i11.CurrencyRepository>(
        () => _i11.CurrencyRepository(gh<_i9.ApiService>()));
    gh.lazySingleton<_i12.ExpenseRepository>(
        () => _i12.ExpenseRepository(gh<_i9.ApiService>()));
    gh.lazySingleton<_i13.IncomeRepository>(
        () => _i13.IncomeRepository(gh<_i9.ApiService>()));
    gh.lazySingleton<_i14.UserRepository>(
        () => _i14.UserRepository(gh<_i9.ApiService>()));
    gh.factory<_i15.AppRouter>(() => _i15.AppRouter(gh<_i10.AuthGuard>()));
    gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(
          gh<_i7.Preferences>(),
          gh<_i14.UserRepository>(),
        ));
    gh.factory<_i17.CalculatorBloc>(
        () => _i17.CalculatorBloc(gh<_i11.CurrencyRepository>()));
    gh.factory<_i18.DiagramBloc>(() => _i18.DiagramBloc(
          gh<_i7.Preferences>(),
          gh<_i14.UserRepository>(),
          gh<_i12.ExpenseRepository>(),
        ));
    gh.factory<_i19.ProfileBloc>(() => _i19.ProfileBloc(
          gh<_i7.Preferences>(),
          gh<_i14.UserRepository>(),
          gh<_i12.ExpenseRepository>(),
          gh<_i13.IncomeRepository>(),
        ));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}
