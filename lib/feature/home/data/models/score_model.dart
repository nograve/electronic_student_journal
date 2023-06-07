import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic_student_journal/feature/home/data/converters/timestamp_converter.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_model.freezed.dart';
part 'score_model.g.dart';

@freezed
class ScoreModel with _$ScoreModel {
  const factory ScoreModel({
    required String studentUid,
    required int score,
    @TimestampConverter() required DateTime date,
    String? name,
  }) = _ScoreModel;

  const ScoreModel._();

  factory ScoreModel.fromJson(Map<String, Object?> json) =>
      _$ScoreModelFromJson(json);

  ScoreEntity toEntity() => ScoreEntity(
        studentUid: studentUid,
        score: score,
        date: date,
        name: name,
      );
}
