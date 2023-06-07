import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_scores_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_scores_state.dart';
part 'get_scores_cubit.freezed.dart';

class GetScoresCubit extends Cubit<GetScoresState> {
  GetScoresCubit({required GetScoresUseCase getScoresUseCase})
      : _getScoresUseCase = getScoresUseCase,
        super(const _Initial());

  final GetScoresUseCase _getScoresUseCase;

  Future<void> getScores(String tableUid) async {
    emit(const _Loading());
    final response = await _getScoresUseCase.call(TableParams(uid: tableUid));

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (scores) => emit(_Success(scores)),
    );
  }
}
