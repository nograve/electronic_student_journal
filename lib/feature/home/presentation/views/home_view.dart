import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (context, state) {
        state.whenOrNull(
          userSignsIn: (user) =>
              context.read<GetUserDataCubit>().getUserData(user),
          userSingsOut: () => appRouter.go(Routes.signIn.path),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Electronic journal'),
        ),
        body: BlocConsumer<GetUserDataCubit, GetUserDataState>(
          listener: (context, state) {
            state.whenOrNull(
              failure: (_) => context.read<SignOutCubit>().signOut(),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              success: (userEntity) {
                final buttons = <Widget>[];

                switch (userEntity.role) {
                  case UserRole.admin:
                    buttons.add(
                      ElevatedButton(
                        onPressed: () => context.goNamed(
                          Routes.signUp.name,
                          queryParameters: {'userRole': userEntity.role},
                          extra: context.read<UserChangesBloc>(),
                        ),
                        child: const Text('Register user'),
                      ),
                    );
                    break;
                  case UserRole.student:
                    buttons.add(const ScoresButton());
                    break;
                  case UserRole.teacher:
                    buttons.add(const ScoresButton());
                    break;
                }

                buttons.add(
                  ElevatedButton(
                    onPressed: () => context.go(
                      Routes.settings.path,
                      extra: context.read<UserChangesBloc>(),
                    ),
                    child: const Text('Settings'),
                  ),
                );

                return GridView.count(
                  crossAxisCount: 2,
                  children: buttons,
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
