part of 'students_cubit.dart';

@freezed
class StudentsState with _$StudentsState {
  const factory StudentsState.initial(List<UserEntity> students) = _Initial;
  const factory StudentsState.studentAdded(List<UserEntity> students) =
      _StudentAdded;
  const factory StudentsState.studentRemoved(List<UserEntity> students) =
      _StudentRemoved;
}
