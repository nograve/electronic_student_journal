import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/email_provider.dart';
import 'package:electronic_student_journal/utils/ext/auth_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<EmailProvider>(
      builder: (_, emailProvider, __) => TextFormField(
        validator: (email) => email != null
            ? (!email.isValidEmail() ? l10n.invalidEmail : null)
            : null,
        onSaved: (newEmail) => emailProvider.changeEmail(newEmail!),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          labelText: l10n.emailLabelText,
          hintText: l10n.emailHintText,
        ),
        maxLength: 128,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
