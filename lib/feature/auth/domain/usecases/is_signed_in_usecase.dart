import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/repositories/auth_repository.dart';

class IsSignedInUsecase extends UseCase<bool, NoParams> {
  IsSignedInUsecase(this._repository);

  final AuthRepository _repository;
  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _repository.isSignedIn();
  }
}
