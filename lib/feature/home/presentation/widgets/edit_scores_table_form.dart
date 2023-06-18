import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_users_data_cubit_dart_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_names_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/students_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_score_date_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_student_form.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/create_table_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/delete_table_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/score_name_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_list_widget.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_table_name_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/update_table_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditScoresTableForm extends StatelessWidget {
  const EditScoresTableForm({
    this.table,
    super.key,
  });

  final ScoresTableEntity? table;
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: table != null
            // Edit existing table
            ? BlocBuilder<GetUserDataCubit, GetUserDataState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (teacher) {
                      return BlocBuilder<GetScoresCubit, GetScoresState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            success: (scores) {
                              final scoresNames = scores
                                  .map((score) => score.date)
                                  .toSet()
                                  .toList();

                              final studentsUids = scores
                                  .map((score) => score.studentUid)
                                  .toSet()
                                  .toList();

                              return BlocProvider<GetUsersDataCubit>(
                                create: (context) =>
                                    injector()..getUsersData(studentsUids),
                                child: BlocProvider<ScoresNamesCubit>(
                                  create: (context) => ScoresNamesCubit(
                                    scoresNames: scoresNames,
                                  ),
                                  child: BlocBuilder<GetUsersDataCubit,
                                      GetUsersDataState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        success: (students) =>
                                            BlocProvider<StudentsCubit>(
                                          create: (context) =>
                                              StudentsCubit(students: students),
                                          child: BlocProvider<ScoresCubit>(
                                            create: (context) =>
                                                ScoresCubit(scores: scores),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const ScoresTableNameField(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    BlocBuilder<
                                                        ScoresNamesCubit,
                                                        ScoresNamesState>(
                                                      builder:
                                                          (context, state) {
                                                        return ScoreNameField(
                                                          scoresNames:
                                                              state.scoresNames,
                                                        );
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: 50.r,
                                                      height: 50.r,
                                                      child:
                                                          const AddScoreDateButton(),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 8.h,
                                                    bottom: 12.h,
                                                  ),
                                                  child: AddStudentForm(
                                                    teacher: teacher,
                                                  ),
                                                ),
                                                const ScoresListWidget(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 24.h,
                                                  ),
                                                  child: SizedBox(
                                                    width: 200.w,
                                                    height: 50.h,
                                                    child: UpdateTableButton(
                                                      formKey: _formKey,
                                                      table: table!,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 24.h,
                                                  ),
                                                  child: SizedBox(
                                                    width: 200.w,
                                                    height: 50.h,
                                                    child: DeleteTableButton(
                                                      table: table!,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        orElse: () => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            orElse: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              )
            // Create new table
            : BlocBuilder<GetUserDataCubit, GetUserDataState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (userEntity) {
                      final teacher = userEntity;

                      return BlocProvider<ScoresNamesCubit>(
                        create: (context) => ScoresNamesCubit(),
                        child: BlocProvider<StudentsCubit>(
                          create: (context) => StudentsCubit(),
                          child: BlocProvider<ScoresCubit>(
                            create: (context) => ScoresCubit(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const ScoresTableNameField(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocBuilder<ScoresNamesCubit,
                                        ScoresNamesState>(
                                      builder: (context, state) {
                                        return ScoreNameField(
                                          scoresNames: state.scoresNames,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 50.r,
                                      height: 50.r,
                                      child: const AddScoreDateButton(),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.h, bottom: 12.h),
                                  child: AddStudentForm(teacher: teacher),
                                ),
                                const ScoresListWidget(),
                                Padding(
                                  padding: EdgeInsets.only(top: 50.h),
                                  child: CreateTableButton(formKey: _formKey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
