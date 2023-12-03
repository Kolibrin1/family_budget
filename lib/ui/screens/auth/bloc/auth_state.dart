part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.auth({
    String? login,
    String? pass,
    bool? isError,
  }) = _PhoneState;


  const factory AuthState.detail({
    required String login,
    required String pass,
  }) = _DetailState;

  const factory AuthState.loading() = _LoadingState;

  const factory AuthState.info({
    required String message,
    required PageState pageState,
  }) = _InfoState;
}
