import 'package:electronic_student_journal/data/models/person.dart';
import 'package:electronic_student_journal/data/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

///
@freezed
class Student with User, Person, _$Student {
  ///
  const Student._();

  ///
  // ignore: sort_unnamed_constructors_first
  const factory Student({
    required String email,
    required String role,
    required String name,
    required String surname,
    required DateTime lastAccessed,
    required DateTime registeredAt,
  }) = _Student;

  ///
  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);
}
