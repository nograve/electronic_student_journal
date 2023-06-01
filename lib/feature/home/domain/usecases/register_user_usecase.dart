import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/register_repository.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_usecase.freezed.dart';

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    required UserModel user,
    required String password,
  }) = _RegisterParams;
}

class RegisterUserUsecase extends UseCase<void, RegisterParams> {
  RegisterUserUsecase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;

  final RegisterRepository _registerRepository;

  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    final response = _registerRepository.registerUser(params);

    return response;
  }
}
