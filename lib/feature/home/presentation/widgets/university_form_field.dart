import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/university_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class UniversityFormField extends StatelessWidget {
  const UniversityFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<UniversityProvider>(
      builder: (_, universityProvider, __) => TextFormField(
        initialValue: universityProvider.university,
        validator: (university) {
          if (university != null && university.isNotEmpty) {
            return null;
          }
          return l10n.universityErrorText;
        },
        onSaved: (newUniversity) =>
            universityProvider.changeUniversity(newUniversity!),
        decoration: InputDecoration(
          labelText: l10n.universityLabelText,
          hintText: l10n.universityErrorText,
        ),
        maxLength: 128,
      ),
    );
  }
}
