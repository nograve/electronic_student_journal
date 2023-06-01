import 'package:electronic_student_journal/feature/home/presentation/viewmodels/surname_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurnameFormField extends StatelessWidget {
  const SurnameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SurnameProvider>(
      builder: (_, surnameProvider, __) => TextFormField(
        initialValue: surnameProvider.surname,
        validator: (surname) {
          if (surname != null && surname.isNotEmpty) {
            return null;
          }
          return 'Enter surname';
        },
        onSaved: (newSurname) => surnameProvider.changeSurname(newSurname!),
        decoration: const InputDecoration(
          labelText: 'Surname',
          hintText: 'Enter surname',
        ),
        maxLength: 64,
      ),
    );
  }
}
