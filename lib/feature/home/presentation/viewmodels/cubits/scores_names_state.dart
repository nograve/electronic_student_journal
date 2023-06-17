part of 'scores_names_cubit.dart';

@freezed
class ScoresNamesState with _$ScoresNamesState {
  const factory ScoresNamesState.initial(List<DateTime> scoresNames) = _Initial;
  const factory ScoresNamesState.scoreNameAdded(List<DateTime> scoresNames) =
      _ScoreNameAdded;
  const factory ScoresNamesState.scoreNameRemoved(List<DateTime> scoresNames) =
      _ScoreNameRemoved;
}
