import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_data_usecase.freezed.dart';

@freezed
class UserParams with _$UserParams {
  const factory UserParams({
    required User user,
  }) = _UserParams;
}

class GetUserDataUsecase extends UseCase<UserEntity, UserParams> {
  GetUserDataUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) async {
    final response = await _userRepository.getUserData(params.user);

    return response;
  }
}
