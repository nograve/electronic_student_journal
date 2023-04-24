import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/data/datasources/firebase_remote_data_source.dart';
import 'package:electronic_student_journal/feature/data/models/user_model.dart';
import 'package:electronic_student_journal/feature/domain/usecases/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

///
class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
  // UserModel? _currentUser;

  @override
  Future<Either<Failure, UserModel>> signIn(SignInParams signInParams) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: signInParams.email,
        password: signInParams.password,
      );
      // TODO(nograve): Add users collection name to constants
      final doc = await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (doc.data() != null) {
        return Right(UserModel.fromJson(doc.data()!));
      }
      return const Left(EmptyDataFailure('No data'));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server failure.'));
    } on Exception catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    await _firebaseAuth.signOut();
    return const Right(true);
    // _currentUser = null;
  }
}
