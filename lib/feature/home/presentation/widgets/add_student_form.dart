import 'package:electronic_student_journal/feature/home/domain/entities/score_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/find_students_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/find_students_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_names_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/students_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/score_name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/show_student_search_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_student_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddStudentForm extends StatelessWidget {
  const AddStudentForm({
    required this.teacher,
    super.key,
  });

  final UserEntity teacher;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreNameProvider>(
      builder: (context, scoreNameProvider, child) {
        if (scoreNameProvider.scoreName != null) {
          return Consumer<ShowStudentSearchProvider>(
            builder: (_, showStudentSearchProvider, __) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.w,
                  height: 50.h,
                  child: const AddStudentButton(),
                ),
                if (showStudentSearchProvider.showStudentSearch)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: SizedBox(
                          width: 250.w,
                          height: 50.h,
                          child: TextField(
                            onChanged: (query) {
                              context.read<FindStudentsCubit>().findStudents(
                                    FindStudentsParams(
                                      studentNameQuery: query,
                                      teacherUniversity: teacher.university!,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  const SizedBox.shrink(),
                BlocBuilder<FindStudentsCubit, FindStudentsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (students) {
                        if (students.isNotEmpty) {
                          return Column(
                            children: [
                              ...students.map(
                                (student) => Column(
                                  children: [
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    BlocBuilder<ScoresNamesCubit,
                                        ScoresNamesState>(
                                      builder: (context, state) {
                                        final scoresNames = state.scoresNames;

                                        return InkWell(
                                          onTap: () {
                                            context
                                                .read<StudentsCubit>()
                                                .addStudent(student);

                                            for (final scoreName
                                                in scoresNames) {
                                              context
                                                  .read<ScoresCubit>()
                                                  .addScore(
                                                    ScoreEntity(
                                                      studentUid: student.uid,
                                                      score: -1,
                                                      date: scoreName,
                                                    ),
                                                  );
                                            }

                                            context
                                                .read<
                                                    ShowStudentSearchProvider>()
                                                .toggleVisibility();

                                            context
                                                .read<FindStudentsCubit>()
                                                .findStudents(
                                                  const FindStudentsParams(
                                                    studentNameQuery: '',
                                                    teacherUniversity: '',
                                                  ),
                                                );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                student.group!,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.w),
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      orElse: SizedBox.shrink,
                    );
                  },
                )
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
