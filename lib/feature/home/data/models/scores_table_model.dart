import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic_student_journal/feature/home/data/converters/timestamp_converter.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scores_table_model.freezed.dart';
part 'scores_table_model.g.dart';

@freezed
class ScoresTableModel with _$ScoresTableModel {
  const factory ScoresTableModel({
    required String name,
    @TimestampConverter() required DateTime createdAt,
    required String ownerUid,
    required String uid,
  }) = _ScoresTableModel;

  const ScoresTableModel._();

  factory ScoresTableModel.fromJson(Map<String, Object?> json) =>
      _$ScoresTableModelFromJson(json);

  ScoresTableEntity toEntity() => ScoresTableEntity(
        name: name,
        createdAt: createdAt,
        ownerUid: ownerUid,
        uid: uid,
      );
}
