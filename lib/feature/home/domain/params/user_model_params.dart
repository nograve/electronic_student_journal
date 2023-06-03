import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model_params.freezed.dart';

@freezed
class UserModelParams with _$UserModelParams {
  const factory UserModelParams({
    required UserModel user,
  }) = _UserModelParams;
}
