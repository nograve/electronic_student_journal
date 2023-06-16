part of 'update_table_cubit.dart';

@freezed
class UpdateTableState with _$UpdateTableState {
  const factory UpdateTableState.initial() = _Initial;
  const factory UpdateTableState.loading() = _Loading;
  const factory UpdateTableState.success() = _Success;
  const factory UpdateTableState.failure(String message) = _Failure;
}
