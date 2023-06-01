import 'package:electronic_student_journal/feature/home/presentation/viewmodels/university_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UniversityFormField extends StatelessWidget {
  const UniversityFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityProvider>(
      builder: (_, universityProvider, __) => TextFormField(
        initialValue: universityProvider.university,
        validator: (university) {
          if (university != null && university.isNotEmpty) {
            return null;
          }
          return "Enter university's name";
        },
        onSaved: (newUniversity) =>
            universityProvider.changeUniversity(newUniversity!),
        decoration: const InputDecoration(
          labelText: 'University',
          hintText: 'Enter university',
        ),
        maxLength: 128,
      ),
    );
  }
}
