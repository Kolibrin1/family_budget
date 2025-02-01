import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/data/bloc_categories/categories_cubit.dart';
import 'package:family_budget/data/models/user_model.dart';
import 'package:family_budget/data/repositories/auth_repository.dart';
import 'package:family_budget/data/repositories/user_repository.dart';
import 'package:family_budget/helpers/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../helpers/constants.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.prefs, this.userRepository, this.authRepository)
      : super(
          const AuthState.loading(),
        ) {
    on<_InitialEvent>(_onInitialEvent);
    on<_DetailEvent>(_onDetailEvent);
    on<_AuthEvent>(_onAuthEvent);
  }

  AuthState oldState = AuthState.loading();
  final UserRepository userRepository;
  final AuthRepository authRepository;
  final Preferences prefs;
  UserModel? curUser;

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      emit(
        AuthState.auth(login: event.login ?? '', pass: event.pass ?? ''),
      );
      oldState = const AuthState.auth();
    } catch (ex) {
      ex as DioException;
      if (ex.response != null) {
        emit(
          _InfoState(
            message: ex.response!.data.toString(),
            pageState: PageState.error,
          ),
        );
      } else {
        emit(
          _InfoState(
            message: ex.toString(),
            pageState: PageState.error,
          ),
        );
      }
    }
  }

  void _onDetailEvent(
    _DetailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const _LoadingState());

    if (event.authType == AuthType.register) {
      try {
        final isExist = await authRepository.checkLogin(event.login);
        if(isExist) {
          emit(AuthState.auth(
            login: event.login,
            pass: event.pass,
            isError: true,
          ));
          oldState = AuthState.auth(
            login: event.login,
            pass: event.pass,
            isError: true,
          );
        } else {
          emit(AuthState.detail(login: event.login, pass: event.pass));
        }
      } catch (ex) {
        emit(AuthState.auth(
          login: event.login,
          pass: event.pass,
        ));
        oldState = AuthState.auth(
          login: event.login,
          pass: event.pass,
        );
      }
    } else {
      try {
        await authRepository.login(event.login, event.pass);
        prefs.saveUserLogin(event.login);
        prefs.saveUserPass(event.pass);
        await getIt<CategoriesCubit>().loadCategories();
        event.onAuthCompleted();
      } catch (ex) {
        emit(const AuthState.info(
          message: 'Неправильный логин или пароль',
          pageState: PageState.error,
        ));
      }
    }
  }

  void _onAuthEvent(
    _AuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      const _LoadingState(),
    );
    try {
      await authRepository.register(
          event.login, event.pass, event.balance, event.currency);
      prefs.saveUserLogin(event.login);
      prefs.saveUserPass(event.pass);
      await getIt<CategoriesCubit>().loadCategories();
      event.onAuthCompleted();
    } catch (ex) {
      emit(oldState);
      rethrow;
    }
  }
}
