part of 'get_scores_tables_cubit.dart';

@freezed
class GetScoresTablesState with _$GetScoresTablesState {
  const factory GetScoresTablesState.initial() = _Initial;
  const factory GetScoresTablesState.loading() = _Loading;
  const factory GetScoresTablesState.success(List<ScoresTableEntity> tables) =
      _Success;
  const factory GetScoresTablesState.failure(String message) = _Failure;
}
