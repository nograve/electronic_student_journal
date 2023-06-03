import 'package:equatable/equatable.dart';

class ScoreEntity extends Equatable {
  const ScoreEntity(
    this.studentUid,
    this.score,
    this.date,
    this.name,
  );

  final String studentUid;
  final int score;
  final DateTime date;
  final String? name;

  @override
  List<Object?> get props => [
        studentUid,
        score,
        date,
        name,
      ];
}
