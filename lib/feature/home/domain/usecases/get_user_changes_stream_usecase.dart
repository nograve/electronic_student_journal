import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserChangesStreamUseCase extends SyncUseCase<Stream<User?>, NoParams> {
  GetUserChangesStreamUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Either<Failure, Stream<User?>> call(NoParams params) {
    return _authRepository.getUserChangesStream();
  }
}
