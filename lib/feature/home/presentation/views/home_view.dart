import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/auth/presentation/viewmodels/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (_, state) {
        state.maybeWhen(
          success: (userEntity) {
            if (userEntity == null) {
              appRouter.go(Routes.login.path);
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          success: (userEntity) {
            if (userEntity != null) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Electronic journal'),
                  actions: [
                    IconButton(
                      onPressed: () =>
                          context.read<AuthCubit>().signOut(NoParams()),
                      icon: const Icon(Icons.logout),
                    )
                  ],
                ),
                body: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Subjects'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Kek'),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
