import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
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
          userSignsIn: (user) =>
              context.read<GetUserDataCubit>().getUserData(user),
          userSingsOut: () => appRouter.go(Routes.login.path),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Electronic journal'),
        ),
        body: BlocBuilder<GetUserDataCubit, GetUserDataState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (userEntity) {
                return GridView.count(
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
                      onPressed: () => context.go(
                        Routes.settings.path,
                        extra: injector<UserChangesBloc>(),
                      ),
                      child: const Text('Settings'),
                    ),
                  ],
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
