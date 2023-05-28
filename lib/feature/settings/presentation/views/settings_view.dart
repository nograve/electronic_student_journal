import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/settings/presentation/viewmodels/cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (_, state) {
        state.maybeWhen(
          userSingsOut: () => appRouter.go(Routes.login.path),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Settings'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.read<SignOutCubit>().signOut(),
            child: const Text('Log out'),
          ),
        ),
      ),
    );
  }
}
