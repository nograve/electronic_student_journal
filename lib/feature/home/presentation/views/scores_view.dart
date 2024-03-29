import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_scores_tables_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_scores_table_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoresView extends StatelessWidget {
  const ScoresView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (_, state) {
        state.whenOrNull(
          userSignsIn: (user) =>
              context.read<GetUserDataCubit>().getUserData(user.uid),
          userSingsOut: () => appRouter.go(Routes.signIn.path),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.scores),
        ),
        body: BlocBuilder<UserChangesBloc, UserChangesState>(
          builder: (context, userChangesState) {
            userChangesState.whenOrNull(
              userSignsIn: (user) =>
                  context.read<GetUserDataCubit>().getUserData(user.uid),
            );
            return BlocConsumer<GetUserDataCubit, GetUserDataState>(
              listener: (context, state) {
                state.whenOrNull(
                  failure: (_) => context.read<SignOutCubit>().signOut(),
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  success: (userEntity) {
                    context
                        .read<GetScoresTablesCubit>()
                        .getScoresTables(userEntity);

                    return BlocBuilder<GetScoresTablesCubit,
                        GetScoresTablesState>(
                      builder: (context, state) {
                        final buttons = <Widget>[];

                        final scoreTables = state.maybeWhen(
                          success: (tables) => tables,
                          orElse: () => <ScoresTableEntity>[],
                        );

                        final scoreTablesButtons = scoreTables.map(
                          (table) => ElevatedButton(
                            onPressed: () => appRouter.goNamed(
                              Routes.scoresTable.name,
                              extra: (context.read<UserChangesBloc>(), table),
                              queryParameters: {'userRole': userEntity.role},
                            ),
                            child: Text(
                              table.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        );

                        if (userEntity.role == UserRole.teacher) {
                          buttons.add(const AddScoresTableButton());
                        }

                        buttons.addAll(scoreTablesButtons);

                        return GridView.count(
                          crossAxisCount: 3,
                          children: buttons,
                        );
                      },
                    );
                  },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
