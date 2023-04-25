import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/repositories/auth_repository.dart';

///
class SignOut extends UseCase<bool, NoParams> {
  ///
  SignOut(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async =>
      _repository.signOut();
}
