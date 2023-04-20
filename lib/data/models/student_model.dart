import 'package:electronic_student_journal/domain/entities/student.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

///
@freezed
class StudentModel extends Student with _$StudentModel {
  ///
  const factory StudentModel({
    required String id,
    required String email,
    required String role,
    required String name,
    required String surname,
    required DateTime lastAccessed,
    required DateTime registeredAt,
  }) = _StudentModel;

  ///
  factory StudentModel.fromJson(Map<String, Object?> json) =>
      _$StudentModelFromJson(json);

  ///
  Student toEntity() => Student(
        name: name,
        surname: surname,
        id: id,
        email: email,
        role: role,
        lastAccessed: lastAccessed,
        registeredAt: registeredAt,
      );
}
