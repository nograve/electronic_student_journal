import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (context, state) {
        state.maybeWhen(
          userSingsOut: () => appRouter.go(Routes.login.path),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Electronic journal'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Subjects'),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Kek'),
            // ),
            ElevatedButton(
              onPressed: () => context.go(Routes.settings.path),
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
