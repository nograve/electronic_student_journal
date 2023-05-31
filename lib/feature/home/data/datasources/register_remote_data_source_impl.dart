import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/register_remote_data_source.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, void>> registerUser(
    UserCredentialsParams params,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? "Can't create this user"));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}
