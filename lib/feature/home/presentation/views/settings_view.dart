import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
          title: Text(l10n.settings),
        ),
        body: Center(
          child: SizedBox(
            width: 150.w,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
                toast('Signed out');
                context.read<SignOutCubit>().signOut();
              },
              child: Text(l10n.signOutButtonText),
            ),
          ),
        ),
      ),
    );
  }
}
