import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_params.freezed.dart';

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    required UserModel user,
    required String password,
  }) = _RegisterParams;
}
