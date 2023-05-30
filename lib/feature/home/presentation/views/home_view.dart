import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
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
          userSingsOut: () => appRouter.go(Routes.signIn.path),
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
                final buttons = <ElevatedButton>[];

                switch (userEntity.role) {
                  case UserRole.admin:
                    buttons.add(
                      ElevatedButton(
                        onPressed: () => context.goNamed(
                          Routes.signUp.name,
                          queryParameters: {'userRole': userEntity.role},
                          extra: injector<UserChangesBloc>(),
                        ),
                        child: const Text('Register user'),
                      ),
                    );
                    break;
                  default:
                }

                buttons.add(
                  ElevatedButton(
                    onPressed: () => context.go(
                      Routes.settings.path,
                      extra: injector<UserChangesBloc>(),
                    ),
                    child: const Text('Settings'),
                  ),
                );

                return GridView.count(
                  crossAxisCount: 2,
                  children: buttons
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: const Text('Subjects'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: const Text('Kek'),
                  // ),
                  ,
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
