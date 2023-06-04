import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScoresTableView extends StatelessWidget {
  const ScoresTableView({super.key, this.userRole});

  final String? userRole;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tableTitle),
        actions: [
          if (userRole == UserRole.teacher)
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}
