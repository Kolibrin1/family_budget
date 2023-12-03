import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:family_budget/data/models/user_model.dart';
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
  AuthBloc(this.prefs, this.userRepository)
      : super(
          const AuthState.loading(),
        ) {
    on<_InitialEvent>(_onInitialEvent);
    on<_DetailEvent>(_onDetailEvent);
    on<_AuthEvent>(_onAuthEvent);
  }

  AuthState oldState = AuthState.loading();
  final UserRepository userRepository;
  final Preferences prefs;
  UserModel? curUser;

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const _LoadingState());
    try {
      emit(
        const AuthState.auth(),
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
        await userRepository.findUserByLogin(event.login);
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
      } catch (ex) {
        emit(AuthState.detail(login: event.login, pass: event.pass));
      }
    } else {
      try {
        curUser = await userRepository.getCurrentUser(event.login, event.pass);
        prefs.saveUserLogin(event.login);
        prefs.saveUserPass(event.pass);
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
      curUser = await userRepository.createUser(
          event.login, event.pass, event.balance, event.currency);
      prefs.saveUserLogin(event.login);
      prefs.saveUserPass(event.pass);
      event.onAuthCompleted();
    } catch (ex) {
      emit(oldState);
      rethrow;
    }
  }
}
