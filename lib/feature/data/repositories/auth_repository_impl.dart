import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/data/datasources/firebase_remote_data_source.dart';
import 'package:electronic_student_journal/feature/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/feature/domain/usecases/log_in.dart';

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
