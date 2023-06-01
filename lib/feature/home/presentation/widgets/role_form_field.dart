import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/role_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoleFormField extends StatelessWidget {
  const RoleFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RoleProvider>(
      builder: (_, roleProvider, __) => DropdownButtonFormField<String>(
        items: <String>[UserRole.student, UserRole.teacher]
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        hint: const Text('Select user role'),
        validator: (role) => role == null ? 'Please select user role' : null,
        onChanged: (role) => roleProvider.changeRole(role!),
      ),
    );
  }
}
