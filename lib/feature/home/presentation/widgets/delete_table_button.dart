import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/delete_table_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteTableButton extends StatelessWidget {
  const DeleteTableButton({
    required this.table,
    super.key,
  });

  final ScoresTableEntity table;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ElevatedButton(
      onPressed: () {
        context.read<DeleteTableCubit>().deleteTable(
              TableParams(uid: table.uid),
            );
        appRouter.go(Routes.home.path);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: Text(l10n.deleteTable),
    );
  }
}
