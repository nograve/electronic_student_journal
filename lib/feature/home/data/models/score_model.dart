import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_model.freezed.dart';
part 'score_model.g.dart';

@freezed
class ScoreModel with _$ScoreModel {
  const factory ScoreModel({
    required String studentUid,
    required int score,
    required DateTime date,
  }) = _ScoreModel;

  factory ScoreModel.fromJson(Map<String, Object?> json) =>
      _$ScoreModelFromJson(json);
}
