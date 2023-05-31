import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/sign_up_form.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/pop_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    this.userRole,
    super.key,
  });

  final String? userRole;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (_, state) {
        state.maybeWhen(
          userSingsOut: () => appRouter.go(Routes.signIn.path),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const PopUpButton(),
          title: const Text('Sign up user'),
        ),
        body: userRole == UserRole.admin
            ? const SignUpForm()
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
