import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/data/datasources/firebase_remote_data_source.dart';
import 'package:electronic_student_journal/data/failure.dart';
import 'package:electronic_student_journal/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/domain/usecases/log_in.dart';

///
class AuthRepositoryImpl implements AuthRepository {
  ///
  AuthRepositoryImpl(this._firebaseRemoteDataSource);

  final FirebaseRemoteDataSource _firebaseRemoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> signIn(LogInParams logInParams) async {
    final response = await _firebaseRemoteDataSource.signIn(logInParams);
    return response.fold(
      Left.new,
      (signInResponse) => Right(signInResponse.toEntity()),
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseRemoteDataSource.signOut();
  }
}
