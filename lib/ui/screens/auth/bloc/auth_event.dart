part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthInitEvent extends AuthEvent {
  AuthInitEvent({
    required this.authType,
    this.login,
    this.pass,
  });

  final AuthType authType;
  final String? login;
  final String? pass;
}

class AuthDetailEvent extends AuthEvent {
  AuthDetailEvent({
    required this.login,
    required this.pass,
    required this.authType,
    required this.onAuthCompleted,
  });

  final String login;
  final String pass;
  final AuthType authType;
  final Function() onAuthCompleted;
}

class OnAuthEvent extends AuthEvent {
  OnAuthEvent({
    required this.login,
    required this.pass,
    required this.balance,
    required this.currency,
    required this.authType,
    required this.onAuthCompleted,
  });

  final String login;
  final String pass;
  final double balance;
  final String currency;
  final AuthType authType;
  final Function() onAuthCompleted;
}
