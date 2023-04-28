import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/post_sign_in.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn(SignInParams signInParams);

  Future<Either<Failure, bool>> signOut();
}
