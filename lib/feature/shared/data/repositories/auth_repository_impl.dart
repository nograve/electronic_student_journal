import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required FirebaseAuthRemoteDataSource firebaseRemoteDataSource,
  }) : _firebaseRemoteDataSource = firebaseRemoteDataSource;

  final FirebaseAuthRemoteDataSource _firebaseRemoteDataSource;

  @override
  Future<Either<Failure, User>> signIn(UserCredentialsParams params) async {
    final response = await _firebaseRemoteDataSource.signIn(params);
    return response;
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    final response = await _firebaseRemoteDataSource.signOut();
    return response;
  }

  @override
  Either<Failure, Stream<User?>> getUserChangesStream() {
    return _firebaseRemoteDataSource.getUserChangesStream();
  }
}
