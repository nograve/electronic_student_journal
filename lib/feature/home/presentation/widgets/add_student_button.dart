import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/show_student_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddStudentButton extends StatelessWidget {
  const AddStudentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<ShowStudentSearchProvider>(
      builder: (_, showStudentSearchProvider, __) => ElevatedButton(
        onPressed: () => showStudentSearchProvider.toggleVisibility(),
        child: Text(l10n.addStudent),
      ),
    );
  }
}
