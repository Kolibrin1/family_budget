part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initial({
    required AuthType authType,
    String? login,
    String? pass,
  }) = _InitialEvent;

  const factory AuthEvent.detail({
    required String login,
    required String pass,
    required AuthType authType,
    required Function() onAuthCompleted,
  }) = _DetailEvent;

  const factory AuthEvent.auth({
    required String login,
    required String pass,
    required double balance,
    required String currency,
    required AuthType authType,
    required Function() onAuthCompleted,
  }) = _AuthEvent;
}
