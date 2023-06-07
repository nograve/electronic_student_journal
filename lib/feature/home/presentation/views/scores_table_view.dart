import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
              final tableName = Text(table.name);

              final scoresTitles = scores.map((score) {
                return DecoratedBox(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(
                    '${score.name} '
                    '${DateFormat('dd/MM/yyyy').format(score.date)}',
                  ),
                );
              }).toSet();

              for (final score in scores) {
                context.read<GetUserDataCubit>().getUserData(score.studentUid);
              }

              final scoresValues = scores.map(
                (scores) => DecoratedBox(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text('${scores.score}'),
                ),
              );

              return BlocBuilder<GetUserDataCubit, GetUserDataState>(
                builder: (context, state) => state.maybeWhen(
                  success: (userEntity) {
                    final studentsFullNames = <Text>[
                      Text('${userEntity.surname} ${userEntity.name} '
                          '${userEntity.patronymic}')
                    ];

                    final resultTable = <Widget>[
                      tableName,
                      ...scoresTitles,
                      ...studentsFullNames,
                      ...scoresValues
                    ];

                    return GridView.count(
                      crossAxisCount: scores.length + 1,
                      children: resultTable,
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
