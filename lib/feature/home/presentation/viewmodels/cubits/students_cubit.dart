import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'students_state.dart';
part 'students_cubit.freezed.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit({List<UserEntity>? students}) : super(_Initial(students ?? []));

  void addStudent(UserEntity student) {
    final students = List.of(state.students)..add(student);

    emit(_StudentAdded(students));
  }

  void removeStudent(UserEntity student) {
    final students = List.of(state.students)..remove(student);

    emit(_StudentRemoved(students));
  }
}
