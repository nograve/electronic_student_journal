import 'package:electronic_student_journal/feature/home/presentation/widgets/edit_scores_table_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditScoresTableView extends StatelessWidget {
  const EditScoresTableView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tableTitle),
      ),
      body: const EditScoresTableForm(),
    );
  }
}
