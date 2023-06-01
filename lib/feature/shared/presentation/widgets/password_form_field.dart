import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_controller.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_hinter.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:electronic_student_journal/utils/ext/auth_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer2<PasswordProvider, PasswordHinter>(
      builder: (_, passwordProvider, passwordHinter, __) => TextFormField(
        controller: PasswordController.maybeOf(context)?.controller,
        obscureText: passwordHinter.isPasswordHinted,
        enableSuggestions: false,
        autocorrect: false,
        validator: (password) => password != null
            ? (!password.isValidPassword() ? l10n.invalidPassword : null)
            : null,
        onSaved: (newPassword) => passwordProvider.changePassword(newPassword!),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: l10n.passwordLabelText,
          hintText: l10n.passwordHintText,
          errorMaxLines: 2,
          suffixIcon: IconButton(
            onPressed: () => passwordHinter.toggleVisibility(),
            icon: const Icon(Icons.remove_red_eye),
          ),
        ),
        maxLength: 128,
      ),
    );
  }
}
