import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/excel_repository.dart';

class ExportTableToExcelUseCase
    extends AsyncUseCase<void, ExportingTableParams> {
  ExportTableToExcelUseCase({required ExcelRepository excelRepository})
      : _excelRepository = excelRepository;

  final ExcelRepository _excelRepository;

  @override
  Future<Either<Failure, void>> call(ExportingTableParams params) {
    final response = _excelRepository.exportToExcel(params);

    return response;
  }
}
