import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_confirmer_hinter.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_confirmer_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordConfirmerFormField extends StatelessWidget {
  const PasswordConfirmerFormField({super.key});

  @override
  Widget build(BuildContext context) {
    //
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
        validator: (password) => password != passwordProvider.password
            ? "Passwords don't match"
            : null,
        onSaved: (newPassword) =>
            passwordConfirmerProvider.changeConfirmedPassword(newPassword!),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Confirm password',
          hintText: 'Enter password again',
          suffixIcon: IconButton(
            onPressed: () => passwordConfirmerHinter.toggleVisibility(),
            icon: const Icon(Icons.remove_red_eye),
          ),
        ),
      ),
    );
  }
}
