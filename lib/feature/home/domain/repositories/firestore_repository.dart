import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/edit_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/users_params.dart';

abstract interface class FirestoreRepository {
  Future<Either<Failure, UserEntity>> getUserData(String uid);
  Future<Either<Failure, void>> updateAccessTime(UserParams params);
  Future<Either<Failure, List<ScoresTableEntity>>> getScoresTables(
    UserModelParams params,
  );
  Future<Either<Failure, List<ScoreEntity>>> getScores(TableParams params);
  Future<Either<Failure, List<UserEntity>>> getUsersData(
    UsersParams usersParams,
  );
  Future<Either<Failure, void>> deleteTable(TableParams params);
  Future<Either<Failure, void>> createTable(EditTableParams params);
  Future<Either<Failure, void>> updateTable(EditTableParams params);
}
