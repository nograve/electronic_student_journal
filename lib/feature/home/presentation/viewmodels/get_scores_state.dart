part of 'get_scores_cubit.dart';

@freezed
class GetScoresState with _$GetScoresState {
  const factory GetScoresState.initial() = _Initial;
  const factory GetScoresState.loading() = _Loading;
  const factory GetScoresState.success(List<ScoreEntity> scores) = _Success;
  const factory GetScoresState.failure(String message) = _Failure;
}
