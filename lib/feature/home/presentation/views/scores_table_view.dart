import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/export_to_excel_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_users_data_cubit_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
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
                        '${DateFormat('dd/MM/yyyy').format(score.date)}',
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
                                child: Text(score.toString()),
                              ),
                            )
                            .toList(),
                      ),
                    );

                    final resultScores = <dynamic>[];
                    for (var i = 0; i < studentsFullNames.length; i++) {
                      resultScores.addAll([
                        studentsFullNames[i],
                        ...scoresMap.values.toList()[i],
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
