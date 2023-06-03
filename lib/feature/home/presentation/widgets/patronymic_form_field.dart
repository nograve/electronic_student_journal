import 'package:electronic_student_journal/feature/home/presentation/viewmodels/patronymic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PatronymicFormField extends StatelessWidget {
  const PatronymicFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<PatronymicProvider>(
      builder: (_, patronymicProvider, __) => TextFormField(
        initialValue: patronymicProvider.patronymic,
        validator: (patronymic) {
          if (patronymic != null && patronymic.isNotEmpty) {
            return null;
          }
          return l10n.patronymicErrorText;
        },
        onSaved: (newPatronymic) =>
            patronymicProvider.changePatronymic(newPatronymic!),
        decoration: InputDecoration(
          labelText: l10n.patronymicLabelText,
          hintText: l10n.patronymicErrorText,
        ),
        maxLength: 64,
      ),
    );
  }
}
