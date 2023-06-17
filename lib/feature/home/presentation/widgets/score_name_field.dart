import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/score_name_provider.dart';
import 'package:electronic_student_journal/utils/ext/score_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreNameField extends StatelessWidget {
  const ScoreNameField({required this.scoresNames, super.key});

  final List<DateTime> scoresNames;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreNameProvider>(
      builder: (_, scoreNameProvider, __) => DropdownButton<String>(
        value: scoreNameProvider.scoreName,
        items: scoresNames
            .map(
              (scoreName) => DropdownMenuItem(
                value: scoreName.scoreDateFormat(),
                child: Text(scoreName.scoreDateFormat()),
              ),
            )
            .toList(),
        onChanged: (newScoreName) {
          scoreNameProvider.changeScoreName(newScoreName!);
        },
      ),
    );
  }
}
