import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn(SignInParams signInParams);

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, UserEntity?>> isSignedIn();
}
