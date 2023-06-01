import 'package:electronic_student_journal/feature/home/presentation/viewmodels/patronymic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatronymicFormField extends StatelessWidget {
  const PatronymicFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PatronymicProvider>(
      builder: (_, patronymicProvider, __) => TextFormField(
        initialValue: patronymicProvider.patronymic,
        validator: (patronymic) {
          if (patronymic != null && patronymic.isNotEmpty) {
            return null;
          }
          return 'Enter patronymic';
        },
        onSaved: (newPatronymic) =>
            patronymicProvider.changePatronymic(newPatronymic!),
        decoration: const InputDecoration(
          labelText: 'Patronymic',
          hintText: 'Enter patronymic',
        ),
        maxLength: 64,
      ),
    );
  }
}
