import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/export_to_excel_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_users_data_cubit_dart_cubit.dart';
import 'package:electronic_student_journal/utils/ext/score_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';

class ScoresTableView extends StatelessWidget {
  const ScoresTableView({
    required this.userRole,
    required this.table,
    super.key,
  });

  final String userRole;
  final ScoresTableEntity table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(table.name),
        actions: [
          if (userRole == UserRole.teacher)
            IconButton(
              onPressed: () => context.goNamed(
                Routes.editScoresTable.name,
                extra: (context.read<UserChangesBloc>(), table),
                queryParameters: {'userRole': userRole},
              ),
              icon: const Icon(Icons.edit),
            ),
        ],
      ),
      body: BlocBuilder<GetScoresCubit, GetScoresState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (scores) {
              final tableName = table.name;
              final tableNameText = Text(tableName);

              final scoresTitles = scores
                  .map(
                    (score) => '${score.name} '
                        '${score.date.scoreDateFormat()}',
                  )
                  .toSet()
                  .toList();

              final scoresTitlesTexts = scoresTitles.map((scoreTitle) {
                return DecoratedBox(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(scoreTitle),
                );
              });

              final studentsUids =
                  scores.map((score) => score.studentUid).toSet().toList();

              context.read<GetUsersDataCubit>().getUsersData(studentsUids);

              return BlocBuilder<GetUsersDataCubit, GetUsersDataState>(
                builder: (context, state) => state.maybeWhen(
                  success: (userEntities) {
                    final scoresMap = <String, List<int>>{};
                    final studentsFullNames = <String>[];

                    for (var i = 0; i < userEntities.length; i++) {
                      studentsFullNames.add('${userEntities[i].surname} '
                          '${userEntities[i].name![0]}. '
                          '${userEntities[i].patronymic![0]}.');

                      final scoresValues = scores
                          .where(
                            (score) => score.studentUid == userEntities[i].uid,
                          )
                          .map((score) => score.score)
                          .toList();

                      scoresMap.addAll({studentsFullNames[i]: scoresValues});
                    }

                    final studentsFullNamesTexts =
                        studentsFullNames.map(Text.new).toList();

                    final scoresMapWidgets = scoresMap.map(
                      (studentFullName, scoresValues) => MapEntry(
                        studentFullName,
                        scoresValues
                            .map(
                              (score) => DecoratedBox(
                                decoration: BoxDecoration(border: Border.all()),
                                child:
                                    // TODO(nograve): Solve checking for -1 in
                                    // scores only once
                                    Text(score == -1 ? '' : score.toString()),
                              ),
                            )
                            .toList(),
                      ),
                    );

                    // TODO(nograve): Move this to export table data source
                    final resultScores = <dynamic>[];
                    for (var i = 0; i < studentsFullNames.length; i++) {
                      final studentScores = <dynamic>[];
                      for (var j = 0;
                          j < scoresMap.values.toList()[i].length;
                          j++) {
                        if (scoresMap.values.toList()[i][j] == -1) {
                          studentScores.add('');
                        } else {
                          studentScores.add(scoresMap.values.toList()[i][j]);
                        }
                      }

                      resultScores.addAll([
                        studentsFullNames[i],
                        ...studentScores,
                      ]);
                    }

                    final resultScoresWidgets = <Widget>[];
                    for (var i = 0; i < studentsFullNamesTexts.length; i++) {
                      resultScoresWidgets.addAll([
                        studentsFullNamesTexts[i],
                        ...scoresMapWidgets.values.toList()[i],
                      ]);
                    }

                    final resultTable = <Widget>[
                      tableNameText,
                      ...scoresTitlesTexts,
                      ...resultScoresWidgets,
                    ];

                    final crossAxisCount = scoresTitlesTexts.length + 1;
                    final mainAxisCount = studentsFullNamesTexts.length + 1;
                    final content = <dynamic>[
                      tableName,
                      ...scoresTitles,
                      ...resultScores,
                    ];

                    return Column(
                      children: [
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: crossAxisCount,
                            children: resultTable,
                          ),
                        ),
                        BlocListener<ExportToExcelCubit, ExportToExcelState>(
                          listener: (context, state) => state.whenOrNull(
                            success: () => toast('Saved!'),
                            failure: toast,
                          ),
                          child: ElevatedButton(
                            onPressed: () => context
                                .read<ExportToExcelCubit>()
                                .exportToExcel(
                                  ExportingTableParams(
                                    cols: crossAxisCount,
                                    rows: mainAxisCount,
                                    content: content,
                                    tableName: table.name,
                                  ),
                                ),
                            child: const Text('Export to Excel'),
                          ),
                        ),
                      ],
                    );
                  },
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
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
    );
  }
}
