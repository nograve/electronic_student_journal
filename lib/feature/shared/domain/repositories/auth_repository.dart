import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signIn(SignInParams signInParams);

  Future<Either<Failure, void>> signOut();

  Stream<User?> getUserChangesStream();
}
