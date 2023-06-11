import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';

class GetScoresTablesUseCase
    extends AsyncUseCase<List<ScoresTableEntity>, UserModelParams> {
  GetScoresTablesUseCase({required FirestoreRepository firestoreRepository})
      : _firestoreRepository = firestoreRepository;

  final FirestoreRepository _firestoreRepository;

  @override
  Future<Either<Failure, List<ScoresTableEntity>>> call(
    UserModelParams params,
  ) async {
    final response = await _firestoreRepository.getScoresTables(params);

    return response;
  }
}
