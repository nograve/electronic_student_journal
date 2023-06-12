import 'package:equatable/equatable.dart';

class ScoreEntity extends Equatable {
  const ScoreEntity({
    required this.studentUid,
    required this.score,
    required this.date,
    required this.name,
  });

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
