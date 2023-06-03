import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/role_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RoleFormField extends StatelessWidget {
  const RoleFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<RoleProvider>(
      builder: (_, roleProvider, __) => DropdownButtonFormField<String>(
        items: <String>[l10n.student, l10n.teacher]
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        hint: Text(l10n.selectUserRoleHintText),
        validator: (role) => role == null ? l10n.invalidUserRole : null,
        onChanged: (role) {
          if (role == l10n.student) {
            role = UserRole.student;
          } else if (role == l10n.teacher) {
            role = UserRole.teacher;
          }

          roleProvider.changeRole(role!);
        },
      ),
    );
  }
}
