import 'package:electronic_student_journal/data/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin.freezed.dart';
part 'admin.g.dart';

///
@freezed
class Admin with User, _$Admin {
  ///
  const Admin._();

  ///
  // ignore: sort_unnamed_constructors_first
  const factory Admin({
    required String email,
    required String role,
    required DateTime lastAccessed,
    required DateTime registeredAt,
  }) = _Admin;

  ///
  factory Admin.fromJson(Map<String, Object?> json) => _$AdminFromJson(json);
}
