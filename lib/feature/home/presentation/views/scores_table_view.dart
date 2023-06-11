import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/exporting_table_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/export_to_excel_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
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

              for (final score in scores) {
                context.read<GetUserDataCubit>().getUserData(score.studentUid);
              }

              final scoresValues = scores.map((score) => score.score).toList();

              final scoresValuesWidgets = scoresValues.map(
                (scoresValue) => DecoratedBox(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(scoresValue.toString()),
                ),
              );

              return BlocBuilder<GetUserDataCubit, GetUserDataState>(
                builder: (context, state) => state.maybeWhen(
                  success: (userEntity) {
                    final studentsFullNames =
                        '${userEntity.surname} ${userEntity.name![0]}. '
                        '${userEntity.patronymic![0]}.';

                    final studentsFullNamesTexts = [
                      Text(studentsFullNames),
                    ];

                    final resultTable = <Widget>[
                      tableNameText,
                      ...scoresTitlesTexts,
                      ...studentsFullNamesTexts,
                      ...scoresValuesWidgets
                    ];

                    final crossAxisCount = scoresTitles.length + 1;
                    final mainAxisCount = studentsFullNamesTexts.length + 1;
                    final content = <dynamic>[
                      tableName,
                      ...scoresTitles,
                      studentsFullNames,
                      ...scoresValues
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
