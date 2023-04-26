import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/auth/data/datasources/firebase_remote_data_source.dart';
import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/auth/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in.dart';

///
class AuthRepositoryImpl implements AuthRepository {
  ///
  AuthRepositoryImpl(this._firebaseRemoteDataSource);

  final FirebaseRemoteDataSource _firebaseRemoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> signIn(SignInParams signInParams) async {
    final response = await _firebaseRemoteDataSource.signIn(signInParams);
    return response.fold(
      Left.new,
      (userModel) => Right(userModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    final response = await _firebaseRemoteDataSource.signOut();
    return response.fold(Left.new, Right.new);
  }
}