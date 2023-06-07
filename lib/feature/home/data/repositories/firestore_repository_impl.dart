import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/firestore_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  FirestoreRepositoryImpl({
    required FirestoreRemoteDataSource firestoreRemoteDataSource,
  }) : _firestoreRemoteDataSource = firestoreRemoteDataSource;

  final FirestoreRemoteDataSource _firestoreRemoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> getUserData(String uid) async {
    final response = await _firestoreRemoteDataSource.getUserData(uid);

    return response.fold(
      Left.new,
      (userModel) => Right(userModel.toEntity()),
    );
  }

  @override
  Future<Either<Failure, void>> updateAccessTime(UserParams params) async {
    final response = await _firestoreRemoteDataSource.updateAccessTime(params);

    return response;
  }

  @override
  Future<Either<Failure, List<ScoresTableEntity>>> getScoresTables(
    UserModelParams params,
  ) async {
    final response = await _firestoreRemoteDataSource.getScoresTables(params);

    return response.fold(
      Left.new,
      (scoresTables) =>
          Right(scoresTables.map((table) => table.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, List<ScoreEntity>>> getScores(
    TableParams params,
  ) async {
    final response = await _firestoreRemoteDataSource.getScores(params);

    return response.fold(
      Left.new,
      (scores) => Right(scores.map((score) => score.toEntity()).toList()),
    );
  }
}
