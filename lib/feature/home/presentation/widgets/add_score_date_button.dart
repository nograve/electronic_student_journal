import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_names_cubit.dart';
import 'package:electronic_student_journal/utils/ext/score_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddScoreDateButton extends StatelessWidget {
  const AddScoreDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final scoresNamesCubit = context.read<ScoresNamesCubit>();

        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          scoresNamesCubit.addScoreName(pickedDate.scoreDateFormat());
        }
      },
      child: Icon(
        Icons.add,
        size: 16.r,
      ),
    );
  }
}
