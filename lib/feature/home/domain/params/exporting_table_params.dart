import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exporting_table_params.freezed.dart';

@freezed
class ExportingTableParams with _$ExportingTableParams {
  const factory ExportingTableParams({
    required List<dynamic> content,
    required int rows,
    required int cols,
    required String tableName,
  }) = _ExportingTableParams;
}
