part of 'find_students_cubit.dart';

@freezed
class FindStudentsState with _$FindStudentsState {
  const factory FindStudentsState.initial() = _Initial;
  const factory FindStudentsState.loading() = _Loading;
  const factory FindStudentsState.success(List<UserEntity> students) = _Success;
  const factory FindStudentsState.failure(String message) = _Failure;
}
