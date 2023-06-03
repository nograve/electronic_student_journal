import 'package:electronic_student_journal/feature/home/presentation/widgets/add_score_date_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_student_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_table_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditScoresTableForm extends StatelessWidget {
  const EditScoresTableForm({super.key});

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
            const Row(
              children: [
                AddScoreDateButton(),
              ],
            ),
            const Row(
              children: [
                AddStudentButton(),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text(l10n.create)),
          ],
        ),
      ),
    );
  }
}
