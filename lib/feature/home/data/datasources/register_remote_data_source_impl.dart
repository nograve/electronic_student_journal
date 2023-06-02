import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/register_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/params/register_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, void>> registerUser(
    RegisterParams params,
  ) async {
    try {
      final userCredentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.user.email,
        password: params.password,
      );

      final userUid = userCredentials.user!.uid;
      final userData = params.user.copyWith(uid: userUid);

      await _firebaseFirestore
          .collection('users')
          .doc(userUid)
          .set(userData.toJson());

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? "Can't create this user"));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}
