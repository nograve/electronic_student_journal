import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_students_params.freezed.dart';

@freezed
class FindStudentsParams with _$FindStudentsParams {
  const factory FindStudentsParams({
    required String studentNameQuery,
    required String teacherUniversity,
  }) = _FindStudentsParams;
}
