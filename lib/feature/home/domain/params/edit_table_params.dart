import 'package:electronic_student_journal/feature/home/data/models/score_model.dart';
import 'package:electronic_student_journal/feature/home/data/models/scores_table_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_table_params.freezed.dart';

@freezed
class EditTableParams with _$EditTableParams {
  const factory EditTableParams({
    required ScoresTableModel table,
    required List<ScoreModel> scores,
  }) = _EditTableParams;
}
