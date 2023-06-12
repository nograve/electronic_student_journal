part of 'get_user_data_cubit.dart';

@freezed
class GetUserDataState with _$GetUserDataState {
  const factory GetUserDataState.initial() = _Initial;
  const factory GetUserDataState.loading() = _Loading;
  const factory GetUserDataState.success(UserEntity userEntity) = _Success;
  const factory GetUserDataState.failure(String message) = _Failure;
}
