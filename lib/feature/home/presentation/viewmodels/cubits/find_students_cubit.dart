import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/find_students_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/find_students_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_students_state.dart';
part 'find_students_cubit.freezed.dart';

class FindStudentsCubit extends Cubit<FindStudentsState> {
  FindStudentsCubit({required FindStudentsUseCase findStudentsUseCase})
      : _findStudentsUseCase = findStudentsUseCase,
        super(const _Initial());

  final FindStudentsUseCase _findStudentsUseCase;

  Future<void> findStudents(FindStudentsParams params) async {
    emit(const _Loading());
    final response = await _findStudentsUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (students) => emit(_Success(students)),
    );
  }
}
