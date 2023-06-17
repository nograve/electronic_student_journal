import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/data/models/scores_table_model.dart';
import 'package:electronic_student_journal/feature/home/domain/params/edit_table_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/create_table_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/scores_table_name_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateTableButton extends StatelessWidget {
  const CreateTableButton({
    required GlobalKey<FormState> formKey,
    super.key,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider<CreateTableCubit>(
      create: (context) => injector(),
      child: Consumer<ScoresTableNameProvider>(
        builder: (_, scoresTableNameProvider, __) =>
            BlocBuilder<GetUserDataCubit, GetUserDataState>(
          builder: (context, getUserDataState) {
            return SizedBox(
              width: 150.w,
              height: 50.h,
              child: BlocBuilder<ScoresCubit, ScoresState>(
                builder: (context, scoresState) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final createdTable = ScoresTableModel(
                          name: scoresTableNameProvider.tableName!,
                          createdAt: DateTime.now(),
                          ownerUid: getUserDataState.whenOrNull(
                                success: (userEntity) => userEntity.uid,
                              ) ??
                              '',
                          uid: '',
                        );

                        context.read<CreateTableCubit>().createTable(
                              EditTableParams(
                                table: createdTable,
                                scores: scoresState.scores
                                    .map((score) => score.toModel())
                                    .toList(),
                              ),
                            );

                        appRouter.go(Routes.home.path);
                      }
                    },
                    child: Text(l10n.create),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
