import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_names_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/students_cubit.dart';
import 'package:electronic_student_journal/utils/ext/score_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class AddScoreDateButton extends StatelessWidget {
  const AddScoreDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoresNamesCubit, ScoresNamesState>(
      builder: (context, scoresNameState) =>
          BlocBuilder<StudentsCubit, StudentsState>(
        builder: (context, studentsState) {
          return ElevatedButton(
            onPressed: () async {
              final scoresNamesCubit = context.read<ScoresNamesCubit>();
              final scoresCubit = context.read<ScoresCubit>();

              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                if (!scoresNameState.scoresNames.contains(pickedDate)) {
                  scoresNamesCubit.addScoreName(pickedDate);

                  final students = studentsState.students;
                  for (final student in students) {
                    scoresCubit.addScore(
                      ScoreEntity(
                        studentUid: student.uid,
                        score: -1,
                        date: pickedDate,
                      ),
                    );
                  }
                } else {
                  toast(
                    '${pickedDate.scoreDateFormat()} is already in the list!',
                  );
                }
              }
            },
            child: Icon(
              Icons.add,
              size: 16.r,
            ),
          );
        },
      ),
    );
  }
}
