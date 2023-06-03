import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirestoreRepository {
  Future<Either<Failure, UserEntity>> getUserData(User user);
  Future<Either<Failure, void>> updateAccessTime(UserParams params);
  Future<Either<Failure, List<ScoresTableEntity>>> getScoresTables(
    UserModelParams params,
  );
}
