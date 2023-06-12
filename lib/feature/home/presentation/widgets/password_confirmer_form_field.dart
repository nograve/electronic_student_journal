import 'package:electronic_student_journal/feature/home/presentation/viewmodels/inherited/password_controller.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/password_confirmer_hinter.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/password_confirmer_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PasswordConfirmerFormField extends StatelessWidget {
  const PasswordConfirmerFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer3<PasswordConfirmerProvider, PasswordProvider,
        PasswordConfirmerHinter>(
      builder: (
        _,
        passwordConfirmerProvider,
        passwordProvider,
        passwordConfirmerHinter,
        __,
      ) =>
          TextFormField(
        obscureText: passwordConfirmerHinter.isPasswordHinted,
        enableSuggestions: false,
        autocorrect: false,
        validator: (password) =>
            password != PasswordController.of(context).controller.text
                ? l10n.invalidConfirmPassword
                : null,
        onSaved: (newPassword) =>
            passwordConfirmerProvider.changeConfirmedPassword(newPassword!),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: l10n.confirmPasswordLabelText,
          hintText: l10n.confirmPasswordHintText,
          suffixIcon: IconButton(
            onPressed: () => passwordConfirmerHinter.toggleVisibility(),
            icon: const Icon(Icons.remove_red_eye),
          ),
        ),
      ),
    );
  }
}
