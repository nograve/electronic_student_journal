import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signIn(UserCredentialsParams signInParams);

  Future<Either<Failure, void>> signOut();

  Either<Failure, Stream<User?>> getUserChangesStream();
}
