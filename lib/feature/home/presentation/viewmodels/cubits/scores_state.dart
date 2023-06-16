part of 'scores_cubit.dart';

@freezed
class ScoresState with _$ScoresState {
  const factory ScoresState.initial(List<ScoreEntity> scores) = _Initial;
  const factory ScoresState.scoreAdded(List<ScoreEntity> scores) = _ScoreAdded;
  const factory ScoresState.scoreDeleted(List<ScoreEntity> scores) =
      _ScoreDeleted;
  const factory ScoresState.scoreChanged(List<ScoreEntity> scores) =
      _ScoreChanged;
}
