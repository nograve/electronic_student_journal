import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/user_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, UserModel>> getUserData(User user) async {
    try {
      final doc =
          await _firebaseFirestore.collection('users').doc(user.uid).get();
      if (doc.data() != null) {
        return Right(UserModel.fromJson(doc.data()!));
      }
      return Left(EmptyDataFailure('Empty data: ${doc.data()}'));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}
