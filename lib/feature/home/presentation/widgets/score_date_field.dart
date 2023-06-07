import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:flutter/material.dart';

class ScoreDateField extends StatelessWidget {
  const ScoreDateField({required this.scores, super.key});

  final List<ScoreEntity> scores;

  @override
  Widget build(BuildContext context) {
    final listStrings =
        scores.map((score) => '${score.date} ${score.name}').toSet().toList();
    return DropdownButtonFormField<String>(
      items: listStrings
          .map(
            (value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      onChanged: (a) {},
    );
  }
}
