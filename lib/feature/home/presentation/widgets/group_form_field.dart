import 'package:electronic_student_journal/feature/home/presentation/viewmodels/group_controller.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GroupFormField extends StatelessWidget {
  const GroupFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<GroupProvider>(
      builder: (_, groupProvider, __) => TextFormField(
        controller: GroupController.maybeOf(context)?.controller,
        validator: (group) {
          if (group != null && group.isNotEmpty) {
            return null;
          }
          return l10n.groupErrorText;
        },
        onSaved: (newGroup) => groupProvider.changeGroup(newGroup),
        decoration: InputDecoration(
          labelText: l10n.groupLabelText,
          hintText: l10n.groupErrorText,
        ),
        maxLength: 32,
      ),
    );
  }
}
