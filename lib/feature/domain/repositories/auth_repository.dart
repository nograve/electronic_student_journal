import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/domain/usecases/log_in.dart';

///
abstract class AuthRepository {
  ///
  Future<Either<Failure, UserEntity>> signIn(LogInParams logInParams);

  ///
  Future<void> signOut();
}