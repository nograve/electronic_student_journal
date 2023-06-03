import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/firestore_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/models/scores_table_model.dart';
import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
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

  @override
  Future<Either<Failure, void>> updateAccessTime(UserParams params) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(params.user.uid)
          .update({'lastAccessed': DateTime.now()});
      return const Right(null);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ScoresTableModel>>> getScoresTables(
    UserModelParams params,
  ) async {
    try {
      if (params.user.role == UserRole.student) {
        final tablesSnapshot =
            await _firebaseFirestore.collection('scores_tables').get();

        final tables = <ScoresTableModel>[];

        for (final doc in tablesSnapshot.docs) {
          final scoresSnapshot = await _firebaseFirestore
              .doc(doc.reference.path)
              .collection('scores')
              .where('studentUid', isEqualTo: params.user.uid)
              .get();
          if (scoresSnapshot.docs.isNotEmpty) {
            tables.add(ScoresTableModel.fromJson(doc.data()));
          }
        }

        return Right(tables);
      } else if (params.user.role == UserRole.teacher) {
        final tablesSnapshot = await _firebaseFirestore
            .collection('scores_tables')
            .where('ownerUid', isEqualTo: params.user.uid)
            .get();
        final tables = tablesSnapshot.docs
            .map((doc) => ScoresTableModel.fromJson(doc.data()))
            .toList();

        return Right(tables);
      }
      // TODO(nograve): Add AdminSelectedFailure
      return const Left(SomeFailure('Admin selected.'));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}