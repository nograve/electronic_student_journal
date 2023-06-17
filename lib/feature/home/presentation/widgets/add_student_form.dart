import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/find_students_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/find_students_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/score_name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/show_student_search_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_student_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/score_item_widget.dart';
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
                                (student) => ScoreItemWidget(student: student),
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
