import 'package:electronic_student_journal/feature/home/presentation/viewmodels/group_controller.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/group_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupFormField extends StatelessWidget {
  const GroupFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (_, groupProvider, __) => TextFormField(
        controller: GroupController.maybeOf(context)?.controller,
        validator: (group) {
          if (group != null && group.isNotEmpty) {
            return null;
          }
          return 'Enter group';
        },
        onSaved: (newGroup) => groupProvider.changeGroup(newGroup),
        decoration: const InputDecoration(
          labelText: 'Group',
          hintText: 'Enter group',
        ),
        maxLength: 32,
      ),
    );
  }
}
