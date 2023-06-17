import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scores_state.dart';
part 'scores_cubit.freezed.dart';

class ScoresCubit extends Cubit<ScoresState> {
  ScoresCubit({List<ScoreEntity>? scores}) : super(_Initial(scores ?? []));

  void addScore(ScoreEntity score) {
    final scores = List.of(state.scores)..add(score);

    emit(_ScoreAdded(scores));
  }

  void removeScore(ScoreEntity score) {
    final scores = List.of(state.scores)..remove(score);

    emit(_ScoreDeleted(scores));
  }

  void changeScore({
    required ScoreEntity initialScore,
    required ScoreEntity score,
  }) {
    final scores = List.of(state.scores)
      ..remove(initialScore)
      ..add(score);

    emit(_ScoreChanged(scores));
  }
}
