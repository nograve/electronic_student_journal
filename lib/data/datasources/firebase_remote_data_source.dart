import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/domain/entities/user_entity.dart';

///
abstract class FirebaseRemoteDataSource {
  ///
  Future<Either<Exception, UserEntity>> signIn(String email, String password);

  ///
  Future<void> signOut();
}
