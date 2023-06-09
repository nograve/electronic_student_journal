import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';

abstract interface class ExcelRepository {
  Future<Either<Failure, void>> exportToExcel(ExportingTableParams params);
}
