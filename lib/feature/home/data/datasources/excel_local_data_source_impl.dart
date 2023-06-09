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
      sheet!.setColWidth(2, 50);
      sheet.setColAutoFit(3);

      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3))
          .value = 'Text string';

      sheet
              .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 4))
              .value =
          'Text string Text string Text string Text string Text string';

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