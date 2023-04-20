import 'package:electronic_student_journal/data/models/person.dart';
import 'package:electronic_student_journal/data/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

///
@freezed
class Teacher with User, Person, _$Teacher {
  ///
  const Teacher._();

  ///
  // ignore: sort_unnamed_constructors_first
  const factory Teacher({
    required String email,
    required String role,
    required String name,
    required String surname,
    required DateTime lastAccessed,
    required DateTime registeredAt,
  }) = _Teacher;

  ///
  factory Teacher.fromJson(Map<String, Object?> json) =>
      _$TeacherFromJson(json);
}
