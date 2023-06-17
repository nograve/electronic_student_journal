import 'package:electronic_student_journal/feature/home/data/models/score_model.dart';
import 'package:equatable/equatable.dart';

class ScoreEntity extends Equatable {
  const ScoreEntity({
    required this.studentUid,
    required this.score,
    required this.date,
  });

  final String studentUid;
  final int score;
  final DateTime date;

  ScoreModel toModel() => ScoreModel(
        studentUid: studentUid,
        score: score,
        date: date,
      );

  @override
  List<Object?> get props => [
        studentUid,
        score,
        date,
      ];
}
