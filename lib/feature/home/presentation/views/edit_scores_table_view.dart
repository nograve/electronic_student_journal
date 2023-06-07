import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/edit_scores_table_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditScoresTableView extends StatelessWidget {
  const EditScoresTableView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tableTitle),
      ),
      body: BlocBuilder<UserChangesBloc, UserChangesState>(
        builder: (context, state) {
          return state.maybeWhen(
            userSignsIn: (user) {
              context.read<GetUserDataCubit>().getUserData(user.uid);

              return BlocBuilder<GetUserDataCubit, GetUserDataState>(
                builder: (context, state) => const EditScoresTableForm(),
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
