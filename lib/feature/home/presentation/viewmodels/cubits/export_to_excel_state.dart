part of 'export_to_excel_cubit.dart';

@freezed
class ExportToExcelState with _$ExportToExcelState {
  const factory ExportToExcelState.initial() = _Initial;
  const factory ExportToExcelState.loading() = _Loading;
  const factory ExportToExcelState.success() = _Success;
  const factory ExportToExcelState.failure(String message) = _Failure;
}
