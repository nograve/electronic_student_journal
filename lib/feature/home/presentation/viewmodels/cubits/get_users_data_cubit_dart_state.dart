part of 'get_users_data_cubit_dart_cubit.dart';

@freezed
class GetUsersDataState with _$GetUsersDataState {
  const factory GetUsersDataState.initial() = _Initial;
  const factory GetUsersDataState.loading() = _Loading;
  const factory GetUsersDataState.success(List<UserEntity> userEntities) =
      _Success;
  const factory GetUsersDataState.failure(String message) = _Failure;
}
