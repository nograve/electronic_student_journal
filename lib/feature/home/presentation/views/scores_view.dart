import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/add_scores_table_button.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_button.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/pop_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoresView extends StatelessWidget {
  const ScoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (_, state) {
        state.whenOrNull(
          userSignsIn: (user) =>
              context.read<GetUserDataCubit>().getUserData(user),
          userSingsOut: () => appRouter.go(Routes.signIn.path),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          title: const Text('Scores'),
        ),
        body: BlocBuilder<UserChangesBloc, UserChangesState>(
          builder: (context, userChangesState) {
            userChangesState.whenOrNull(
              userSignsIn: (user) =>
                  context.read<GetUserDataCubit>().getUserData(user),
            );
            return BlocConsumer<GetUserDataCubit, GetUserDataState>(
              listener: (context, state) {
                state.whenOrNull(
                  failure: (_) => context.read<SignOutCubit>().signOut(),
                );
              },
              builder: (context, state) {
                // context.read<GetUserDataCubit>().getUserData(
                //       context.read<UserChangesBloc>().state.whenOrNull(
                //             userSignsIn: (user) => user,
                //           )!,
                //     );

                return state.maybeWhen(
                  success: (userEntity) {
                    final buttons = <Widget>[];

                    if (userEntity.role == UserRole.teacher) {
                      buttons.add(const AddScoresTableButton());
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      children: buttons,
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
