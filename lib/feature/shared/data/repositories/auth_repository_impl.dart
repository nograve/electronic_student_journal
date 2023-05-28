import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/feature/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required FirebaseAuthRemoteDataSource firebaseRemoteDataSource,
  }) : _firebaseRemoteDataSource = firebaseRemoteDataSource;

  final FirebaseAuthRemoteDataSource _firebaseRemoteDataSource;

  @override
  Future<Either<Failure, User>> signIn(SignInParams signInParams) async {
    final response = await _firebaseRemoteDataSource.signIn(signInParams);
    return response;
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    final response = await _firebaseRemoteDataSource.signOut();
    return response;
  }

  @override
  Stream<User?> getUserChangesStream() {
    return _firebaseRemoteDataSource.getUserChangesStream();
  }
}
