import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/data/failure.dart';
import 'package:electronic_student_journal/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/domain/usecases/log_in.dart';

///
abstract class AuthRepository {
  ///
  Future<Either<Failure, UserEntity>> signIn(LogInParams logInParams);

  ///
  Future<void> signOut();
}
