import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_score_date_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_student_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_table_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditScoresTableForm extends StatelessWidget {
  const EditScoresTableForm({
    this.scoresTable,
    super.key,
  });

  final ScoresTableEntity? scoresTable;

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
          ],
        ),
      ),
    );
  }
}
