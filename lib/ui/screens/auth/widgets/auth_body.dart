import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:family_budget/ui/screens/auth/widgets/auth_login_screen.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_detail_screen.dart';

class AuthBodyScreen extends StatelessWidget {
  const AuthBodyScreen(
      {super.key, required this.authType, required this.onAuthCompleted});

  final AuthType authType;
  final Function() onAuthCompleted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>()
        ..add(
          AuthEvent.initial(authType: authType),
        ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.mapOrNull(
            info: (info) {
              showMessage(
                message: info.message,
                type: info.pageState,
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => AppScaffold(
              child: LoadingGif(),
            ),
            auth: (login,pass,isError) => AuthLoginScreen(
              title: authType == AuthType.login ? 'Вход' : 'Регистрация',
              login: login,
              pass: pass,
              isError: isError,
              onAuthCompleted: onAuthCompleted,
            ),
            detail: (login ,pass) => AuthDetailScreen(
              login: login,
              pass: pass,
              onAuthCompleted: onAuthCompleted,
            ),
            orElse: () => AppScaffold(
              child: LoadingGif(),
            ),
          );
        },
      ),
    );
  }
}
