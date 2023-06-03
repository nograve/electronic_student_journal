import 'package:electronic_student_journal/feature/home/presentation/viewmodels/name_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<NameProvider>(
      builder: (_, nameProvider, __) => TextFormField(
        initialValue: nameProvider.name,
        validator: (name) {
          if (name != null && name.isNotEmpty) {
            return null;
          }
          return l10n.nameErrorText;
        },
        onSaved: (newName) => nameProvider.changeName(newName!),
        decoration: InputDecoration(
          labelText: l10n.nameLabelText,
          hintText: l10n.nameErrorText,
        ),
        maxLength: 64,
      ),
    );
  }
}
