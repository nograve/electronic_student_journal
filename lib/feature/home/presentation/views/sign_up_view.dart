import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    this.userRole,
    super.key,
  });

  final String? userRole;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (_, state) {
        state.whenOrNull(
          userSingsOut: () => appRouter.go(Routes.signIn.path),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.signUpUser),
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.only(bottom: 8.h),
          child: userRole == UserRole.admin
              ? const SignUpForm()
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
