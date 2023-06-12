import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/scores_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (context, state) {
        state.whenOrNull(
          userSignsIn: (user) =>
              context.read<GetUserDataCubit>().getUserData(user.uid),
          userSingsOut: () => appRouter.go(Routes.signIn.path),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.appNameTitle),
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
                        child: Text(
                          l10n.signUpUser,
                          textAlign: TextAlign.center,
                        ),
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
                    child: Text(l10n.settings),
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
