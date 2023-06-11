import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, User>> signIn(
    UserCredentialsParams params,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      return Right(userCredential.user!);
      // return const Left(EmptyDataFailure('No data'));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server failure.'));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Either<Failure, Stream<User?>> getUserChangesStream() {
    try {
      return Right(_firebaseAuth.authStateChanges());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
