import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/data/models/score_model.dart';
import 'package:electronic_student_journal/feature/home/data/models/scores_table_model.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/edit_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/create_table_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/delete_table_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_names_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/score_name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/scores_table_name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_score_date_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_student_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/score_name_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_table_name_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditScoresTableForm extends StatelessWidget {
  const EditScoresTableForm({
    this.table,
    super.key,
  });

  final ScoresTableEntity? table;
  static final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: _formkey,
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: table != null
            // Edit existing table
            ? BlocBuilder<GetScoresCubit, GetScoresState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (scores) {
                      final scoresNames = scores
                          .map(
                            (score) => '${score.date} ${score.name}',
                          )
                          .toSet()
                          .toList();
                      return BlocProvider<ScoresNamesCubit>(
                        create: (context) =>
                            ScoresNamesCubit(scoresNames: scoresNames),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ScoresTableNameField(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScoreNameField(
                                  scoresNames: scoresNames,
                                ),
                                SizedBox(
                                  width: 50.r,
                                  height: 50.r,
                                  child: const AddScoreDateButton(),
                                ),
                              ],
                            ),
                            Consumer<ScoreNameProvider>(
                              builder: (context, scoreNameProvider, child) {
                                if (scoreNameProvider.scoreName != null) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: 50.r,
                                        height: 50.r,
                                        child: const AddStudentButton(),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                            SizedBox(
                              width: 150.w,
                              height: 50.h,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(l10n.create),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 24.h),
                              child: SizedBox(
                                width: 150.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<DeleteTableCubit>()
                                        .deleteTable(
                                          TableParams(uid: table!.uid),
                                        );
                                    appRouter.go(Routes.home.path);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text('Remove table'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    orElse: () =>
                        const Center(child: CircularProgressIndicator()),
                  );
                },
              )
            // Create new table
            : BlocProvider<ScoresNamesCubit>(
                create: (context) => ScoresNamesCubit(scoresNames: []),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ScoresTableNameField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<ScoresNamesCubit, ScoresNamesState>(
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
                    Consumer<ScoreNameProvider>(
                      builder: (context, scoreNameProvider, child) {
                        if (scoreNameProvider.scoreName != null) {
                          return Row(
                            children: [
                              SizedBox(
                                width: 50.r,
                                height: 50.r,
                                child: const AddStudentButton(),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    SizedBox(
                      width: 150.w,
                      height: 50.h,
                      child: BlocProvider<CreateTableCubit>(
                        create: (context) => injector(),
                        child: Consumer<ScoresTableNameProvider>(
                          builder: (_, scoresTableNameProvider, __) =>
                              BlocBuilder<GetUserDataCubit, GetUserDataState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    _formkey.currentState!.save();

                                    final createdTable = ScoresTableModel(
                                      name: scoresTableNameProvider.tableName!,
                                      createdAt: DateTime.now(),
                                      ownerUid: state.whenOrNull(
                                            success: (userEntity) =>
                                                userEntity.uid,
                                          ) ??
                                          '',
                                      uid: '',
                                    );

                                    context
                                        .read<CreateTableCubit>()
                                        .createTable(
                                          EditTableParams(
                                            table: createdTable,
                                            scores: <ScoreModel>[],
                                          ),
                                        );

                                    appRouter.go(Routes.home.path);
                                  }
                                },
                                child: Text(l10n.create),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
