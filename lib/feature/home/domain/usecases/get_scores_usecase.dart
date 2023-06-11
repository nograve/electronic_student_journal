import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';

class GetScoresUseCase extends AsyncUseCase<List<ScoreEntity>, TableParams> {
  GetScoresUseCase({required FirestoreRepository firestoreRepository})
      : _firestoreRepository = firestoreRepository;

  final FirestoreRepository _firestoreRepository;

  @override
  Future<Either<Failure, List<ScoreEntity>>> call(TableParams params) async {
    final response = await _firestoreRepository.getScores(params);

    return response;
  }
}
