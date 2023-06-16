part of 'create_table_cubit.dart';

@freezed
class CreateTableState with _$CreateTableState {
  const factory CreateTableState.initial() = _Initial;
  const factory CreateTableState.loading() = _Loading;
  const factory CreateTableState.success() = _Success;
  const factory CreateTableState.failure(String message) = _Failure;
}
