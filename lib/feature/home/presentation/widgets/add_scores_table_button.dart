import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddScoresTableButton extends StatelessWidget {
  const AddScoresTableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.go(
        Routes.editScoresTable.path,
        extra: context.read<UserChangesBloc>(),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      child: Icon(
        Icons.add,
        size: 72.r,
      ),
    );
  }
}
