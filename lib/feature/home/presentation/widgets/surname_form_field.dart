import 'package:electronic_student_journal/feature/home/presentation/viewmodels/surname_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SurnameFormField extends StatelessWidget {
  const SurnameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<SurnameProvider>(
      builder: (_, surnameProvider, __) => TextFormField(
        initialValue: surnameProvider.surname,
        validator: (surname) {
          if (surname != null && surname.isNotEmpty) {
            return null;
          }
          return l10n.surnameErrorText;
        },
        onSaved: (newSurname) => surnameProvider.changeSurname(newSurname!),
        decoration: InputDecoration(
          labelText: l10n.surnameLabelText,
          hintText: l10n.surnameErrorText,
        ),
        maxLength: 64,
      ),
    );
  }
}
