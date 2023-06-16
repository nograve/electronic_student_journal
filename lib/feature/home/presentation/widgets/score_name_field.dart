import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/score_name_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreNameField extends StatelessWidget {
  const ScoreNameField({required this.scoresNames, super.key});

  final List<String> scoresNames;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreNameProvider>(
      builder: (_, scoreNameProvider, __) => DropdownButton<String>(
        value: scoreNameProvider.scoreName,
        items: scoresNames
            .map(
              (scoreName) => DropdownMenuItem(
                value: scoreName,
                child: Text(scoreName),
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
