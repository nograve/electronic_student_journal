import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/delete_table_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_score_date_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_student_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_table_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditScoresTableForm extends StatelessWidget {
  const EditScoresTableForm({
    this.table,
    super.key,
  });

  final ScoresTableEntity? table;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ScoresTableNameField(),
            Row(
              children: [
                // ScoreDateField(scores: ),
                SizedBox(
                  width: 50.r,
                  height: 50.r,
                  child: const AddScoreDateButton(),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 50.r,
                  height: 50.r,
                  child: const AddStudentButton(),
                ),
              ],
            ),
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: ElevatedButton(onPressed: () {}, child: Text(l10n.create)),
            ),
            if (table != null)
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: SizedBox(
                  width: 150.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<DeleteTableCubit>()
                          .deleteTable(TableParams(uid: table!.uid));
                      context.goNamed(
                        Routes.scores.name,
                        extra: (context.read<UserChangesBloc>(), null),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Remove table'),
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
