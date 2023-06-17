import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/find_students_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/find_students_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_names_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/students_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/show_student_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class ScoreItemWidget extends StatelessWidget {
  const ScoreItemWidget({
    required this.student,
    super.key,
  });

  final UserEntity student;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        BlocBuilder<ScoresNamesCubit, ScoresNamesState>(
          builder: (context, state) {
            final scoresNames = state.scoresNames;

            return BlocBuilder<StudentsCubit, StudentsState>(
              builder: (context, state) {
                final students = state.students;

                return InkWell(
                  onTap: () {
                    if (!students.contains(student)) {
                      context.read<StudentsCubit>().addStudent(student);

                      for (final scoreName in scoresNames) {
                        context.read<ScoresCubit>().addScore(
                              ScoreEntity(
                                studentUid: student.uid,
                                score: -1,
                                date: scoreName,
                              ),
                            );
                      }

                      context
                          .read<ShowStudentSearchProvider>()
                          .toggleVisibility();

                      context.read<FindStudentsCubit>().findStudents(
                            const FindStudentsParams(
                              studentNameQuery: '',
                              teacherUniversity: '',
                            ),
                          );
                    } else {
                      toast('Student is already in the list.');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        student.group!,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          student.fullNameWithInitials,
                          style: TextStyle(
                            fontSize: 24.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
