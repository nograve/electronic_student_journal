import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/data/failure.dart';
import 'package:electronic_student_journal/data/models/user_model.dart';
import 'package:electronic_student_journal/domain/usecases/log_in.dart';

///
abstract class FirebaseRemoteDataSource {
  ///
  Future<Either<Failure, UserModel>> signIn(LogInParams logInParams);

  ///
  Future<void> signOut();
}
