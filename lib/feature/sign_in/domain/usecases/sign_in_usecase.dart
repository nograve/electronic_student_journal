import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase extends AsyncUseCase<User, UserCredentialsParams> {
  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, User>> call(UserCredentialsParams params) async =>
      _authRepository.signIn(params);
}
