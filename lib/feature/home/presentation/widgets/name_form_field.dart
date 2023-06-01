import 'package:electronic_student_journal/feature/home/presentation/viewmodels/name_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NameProvider>(
      builder: (_, nameProvider, __) => TextFormField(
        initialValue: nameProvider.name,
        validator: (name) {
          if (name != null && name.isNotEmpty) {
            return null;
          }
          return 'Enter name';
        },
        onSaved: (newName) => nameProvider.changeName(newName!),
        decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'Enter name',
        ),
        maxLength: 64,
      ),
    );
  }
}
