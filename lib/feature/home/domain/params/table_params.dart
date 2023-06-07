import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_params.freezed.dart';

@freezed
class TableParams with _$TableParams {
  const factory TableParams({
    required String uid,
  }) = _TableParams;
}
