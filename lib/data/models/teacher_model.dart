import 'package:electronic_student_journal/domain/entities/teacher.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_model.freezed.dart';
part 'teacher_model.g.dart';

///
@freezed
class TeacherModel extends Teacher with _$TeacherModel {
  ///
  const factory TeacherModel({
    required String id,
    required String email,
    required String role,
    required String name,
    required String surname,
    required DateTime lastAccessed,
    required DateTime registeredAt,
  }) = _TeacherModel;

  ///
  factory TeacherModel.fromJson(Map<String, Object?> json) =>
      _$TeacherModelFromJson(json);

  ///
  Teacher toEntity() => Teacher(
        name: name,
        surname: surname,
        id: id,
        email: email,
        role: role,
        lastAccessed: lastAccessed,
        registeredAt: registeredAt,
      );
}
