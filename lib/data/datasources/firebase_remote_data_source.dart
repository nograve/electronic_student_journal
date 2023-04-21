import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/data/models/user_model.dart';

///
abstract class FirebaseRemoteDataSource {
  ///
  Future<Either<Exception, UserModel>> signIn(
    String email,
    String password,
  );

  ///
  Future<void> signOut();
}
