part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    required UserModel user,
    required List<IncomeModel> incomesList,
  }) = _PhoneState;

  const factory ProfileState.loading() = _LoadingState;

  const factory ProfileState.info({
    required String message,
    required PageState pageState,
  }) = _InfoState;
}
