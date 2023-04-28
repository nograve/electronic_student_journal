import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/auth/data/models/user_model.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/post_sign_in.dart';

abstract class FirebaseRemoteDataSource {
  Future<Either<Failure, UserModel>> signIn(SignInParams signInParams);

  Future<Either<Failure, bool>> signOut();
}
