import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/edit_scores_table_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditScoresTableView extends StatelessWidget {
  const EditScoresTableView({
    this.userRole,
    this.table,
    super.key,
  });

  final String? userRole;
  final ScoresTableEntity? table;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: table != null ? Text(table!.name) : Text(l10n.tableTitle),
      ),
      body: SingleChildScrollView(
        child: EditScoresTableForm(table: table),
      ),
    );
  }
}
