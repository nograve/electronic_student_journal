import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/models/score_model.dart';
import 'package:electronic_student_journal/feature/home/data/models/scores_table_model.dart';
import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/users_params.dart';

abstract interface class FirestoreRemoteDataSource {
  Future<Either<Failure, UserModel>> getUserData(String uid);
  Future<Either<Failure, List<UserModel>>> getUsersData(
    UsersParams params,
  );
  Future<Either<Failure, void>> updateAccessTime(UserParams params);
  Future<Either<Failure, List<ScoresTableModel>>> getScoresTables(
    UserModelParams params,
  );
  Future<Either<Failure, List<ScoreModel>>> getScores(TableParams params);
}
