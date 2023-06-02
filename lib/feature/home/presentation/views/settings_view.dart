import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/pop_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (_, state) {
        state.whenOrNull(
          userSingsOut: () => appRouter.go(Routes.signIn.path),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          title: const Text('Settings'),
        ),
        body: Center(
          child: SizedBox(
            width: 150.w,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () => context.read<SignOutCubit>().signOut(),
              child: const Text('Log out'),
            ),
          ),
        ),
      ),
    );
  }
}
