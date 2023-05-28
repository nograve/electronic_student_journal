import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_usecase.freezed.dart';
part 'sign_in_usecase.g.dart';

class SignInUseCase extends UseCase<User, SignInParams> {
  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, User>> call(SignInParams params) async =>
      _authRepository.signIn(params);
}

@freezed
class SignInParams with _$SignInParams {
  const factory SignInParams({
    required String email,
    required String password,
  }) = _SignInParams;

  factory SignInParams.fromJson(Map<String, dynamic> json) =>
      _$SignInParamsFromJson(json);
}
