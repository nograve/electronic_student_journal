import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/excel_local_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/excel_repository.dart';

class ExcelRepositoryImpl implements ExcelRepository {
  ExcelRepositoryImpl({required ExcelLocalDataSource excelLocalDataSource})
      : _excelLocalDataSource = excelLocalDataSource;

  final ExcelLocalDataSource _excelLocalDataSource;

  @override
  Future<Either<Failure, void>> exportToExcel(
    ExportingTableParams params,
  ) async {
    final response = await _excelLocalDataSource.exportToExcel(params);

    return response;
  }
}
