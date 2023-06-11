import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';

class SignOutUseCase extends AsyncUseCase<void, NoParams> {
  SignOutUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      _authRepository.signOut();
}
