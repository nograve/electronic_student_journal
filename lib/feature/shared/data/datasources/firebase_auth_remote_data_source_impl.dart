import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:electronic_student_journal/feature/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, User>> signIn(SignInParams signInParams) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: signInParams.email,
        password: signInParams.password,
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
  Stream<User?> getUserChangesStream() {
    return _firebaseAuth.userChanges();
  }
}
