import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/export_table_to_excel_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'export_to_excel_state.dart';
part 'export_to_excel_cubit.freezed.dart';

class ExportToExcelCubit extends Cubit<ExportToExcelState> {
  ExportToExcelCubit({
    required ExportTableToExcelUseCase exportTableToExcelUseCase,
  })  : _exportTableToExcelUseCase = exportTableToExcelUseCase,
        super(const _Initial());

  final ExportTableToExcelUseCase _exportTableToExcelUseCase;

  Future<void> exportToExcel(ExportingTableParams params) async {
    emit(const _Loading());
    final response = await _exportTableToExcelUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (_) => emit(const _Success()),
    );
  }
}
