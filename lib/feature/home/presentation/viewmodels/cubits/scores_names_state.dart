part of 'scores_names_cubit.dart';

@freezed
class ScoresNamesState with _$ScoresNamesState {
  const factory ScoresNamesState.initial(List<String> scoresNames) = _Initial;
  const factory ScoresNamesState.scoreNameAdded(List<String> scoresNames) =
      _ScoreNameAdded;
  const factory ScoresNamesState.scoreNameRemoved(List<String> scoresNames) =
      _ScoreNameRemoved;
}
