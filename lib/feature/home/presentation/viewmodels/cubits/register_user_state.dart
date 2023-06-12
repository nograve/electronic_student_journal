part of 'register_user_cubit.dart';

@freezed
class RegisterUserState with _$RegisterUserState {
  const factory RegisterUserState.initial() = _Initial;
  const factory RegisterUserState.loading() = _Loading;
  const factory RegisterUserState.success() = _Success;
  const factory RegisterUserState.failure(String message) = _Failure;
}
