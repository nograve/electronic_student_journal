import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/excel_local_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class ExcelLocalDataSourceImpl implements ExcelLocalDataSource {
  @override
  Future<Either<Failure, void>> exportToExcel(
    ExportingTableParams params,
  ) async {
    try {
      final excel = Excel.createExcel();
      final sheet = excel.sheets[excel.getDefaultSheet()];

      for (var i = 0; i < params.rows; i++) {
        for (var j = 0; j < params.cols; j++) {
          sheet!
              .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i))
              .value = params.content[i * params.cols + j];
        }
      }

      final fileBytes = excel.save(fileName: '${params.tableName}.xlsx');

      final String downloadPath;
      if (Platform.isAndroid) {
        downloadPath = '/storage/emulated/0/Download/';
      } else {
        final directory = await getDownloadsDirectory();
        downloadPath = directory!.path;
      }

      File('$downloadPath/${params.tableName}.xlsx')
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);

      return const Right(null);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}
