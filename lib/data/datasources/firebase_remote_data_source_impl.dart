import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/data/datasources/firebase_remote_data_source.dart';
import 'package:electronic_student_journal/data/models/user_model.dart';
import 'package:electronic_student_journal/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

///
class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
  UserModel? _currentUser;

  @override
  Future<Either<Exception, UserEntity>> signIn(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // TODO(nograve): Add users collection name to constants
      final doc = await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      // TODO(nograve): Add empty data exception here
      if (doc.data() != null) {
        _currentUser = UserModel.fromJson(doc.data()!);
        return Right(_currentUser!.toEntity());
      }
      return Left(Exception());
    } on FirebaseAuthException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _currentUser = null;
  }
}
