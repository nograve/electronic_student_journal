import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/scores_table_name_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ScoresTableNameField extends StatelessWidget {
  const ScoresTableNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<ScoresTableNameProvider>(
      builder: (_, scoresTableNameProvider, __) => TextFormField(
        initialValue: scoresTableNameProvider.tableName,
        validator: (tableName) {
          if (tableName != null && tableName.isNotEmpty) {
            return null;
          }
          return l10n.tableNameErrorText;
        },
        onSaved: (newTableName) =>
            scoresTableNameProvider.changeScoresTableName(newTableName!),
        decoration: InputDecoration(
          labelText: l10n.tableNameLabelText,
          hintText: l10n.tableNameErrorText,
        ),
        maxLength: 64,
      ),
    );
  }
}
