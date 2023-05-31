import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';

abstract interface class RegisterRemoteDataSource {
  Future<Either<Failure, void>> registerUser(UserCredentialsParams params);
}
