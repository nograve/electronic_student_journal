import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/register_user_usecase.dart';

abstract interface class RegisterRemoteDataSource {
  Future<Either<Failure, void>> registerUser(RegisterParams params);
}
