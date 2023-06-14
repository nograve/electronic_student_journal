part of 'delete_table_cubit.dart';

@freezed
class DeleteTableState with _$DeleteTableState {
  const factory DeleteTableState.initial() = _Initial;
  const factory DeleteTableState.loading() = _Loading;
  const factory DeleteTableState.success() = _Success;
  const factory DeleteTableState.failure(String message) = _Failure;
}
