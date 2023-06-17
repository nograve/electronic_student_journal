import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/exception.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/firestore_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/models/score_model.dart';
import 'package:electronic_student_journal/feature/home/data/models/scores_table_model.dart';
import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/edit_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/find_students_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/users_params.dart';

class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, UserModel>> getUserData(String uid) async {
    try {
      final doc = await _firebaseFirestore.collection('users').doc(uid).get();
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
          .doc(params.uid)
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
      throw AdminSelectedException();
    } on AdminSelectedException catch (e) {
      return Left(AdminSelectedFailure(e.toString()));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ScoreModel>>> getScores(
    TableParams params,
  ) async {
    final tableSnapshot = await _firebaseFirestore
        .collection('scores_tables')
        .where('uid', isEqualTo: params.uid)
        .get();

    final scoresSnapshot = await _firebaseFirestore
        .doc(tableSnapshot.docs.first.reference.path)
        .collection('scores')
        .orderBy('date')
        .get();

    final scores = scoresSnapshot.docs
        .map((doc) => ScoreModel.fromJson(doc.data()))
        .toList();

    return Right(scores);
  }

  @override
  Future<Either<Failure, List<UserModel>>> getUsersData(
    UsersParams params,
  ) async {
    try {
      final usersModels = <UserModel>[];

      final uids = params.uids;
      for (final uid in uids) {
        final doc = await _firebaseFirestore.collection('users').doc(uid).get();
        if (doc.data() != null) {
          usersModels.add(UserModel.fromJson(doc.data()!));
        } else {
          throw EmptyDataException();
        }
      }

      return Right(usersModels);
    } on EmptyDataException catch (e) {
      return Left(EmptyDataFailure(e.toString()));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createTable(EditTableParams params) async {
    try {
      final tableReference = await _firebaseFirestore
          .collection('scores_tables')
          .add(params.table.toJson());
      await tableReference.update({'uid': tableReference.id});

      final scoresReference = tableReference.collection('scores');
      for (final score in params.scores) {
        await scoresReference.add(score.toJson());
      }

      return const Right(null);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTable(TableParams params) async {
    try {
      final tableReference =
          _firebaseFirestore.collection('scores_tables').doc(params.uid);

      await _firebaseFirestore.runTransaction<Transaction>(
        (transaction) async => transaction.delete(tableReference),
      );

      return const Right(null);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTable(EditTableParams params) async {
    try {
      final tableReference =
          _firebaseFirestore.collection('scores_tables').doc(params.table.name);
      await tableReference.set(params.table.toJson());

      final scoresReference = tableReference.collection('scores');
      final scoresSnapshot = await scoresReference.get();
      for (final scoreSnapshot in scoresSnapshot.docs) {
        await _firebaseFirestore.runTransaction<Transaction>(
          (transaction) async => transaction.delete(scoreSnapshot.reference),
        );
      }

      for (final score in params.scores) {
        await scoresReference.add(score.toJson());
      }

      return const Right(null);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> findStudents(
    FindStudentsParams params,
  ) async {
    try {
      if (params.studentNameQuery.isEmpty) {
        return const Right([]);
      }

      final response = await _firebaseFirestore
          .collection('users')
          .where('role', isEqualTo: 'student')
          .where('university', isEqualTo: params.teacherUniversity)
          .get();

      final studentsSnapshot = response.docs;

      final students = studentsSnapshot
          .map((studentSnapshot) => UserModel.fromJson(studentSnapshot.data()))
          .where(
            (student) => student.fullName!
                .toLowerCase()
                .contains(params.studentNameQuery.toLowerCase()),
          )
          .toList();

      return Right(students);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}
