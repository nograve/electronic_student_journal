import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/email_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_hinter.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/sign_in_cubit.dart';
import 'package:electronic_student_journal/utils/ext/auth_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 32.h, 12.w, 16.h),
            child: Consumer<EmailProvider>(
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
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 24.h),
            child: Consumer2<PasswordProvider, PasswordHinter>(
              builder: (_, passwordProvider, passwordHinter, __) =>
                  TextFormField(
                obscureText: passwordHinter.isPasswordHinted,
                enableSuggestions: false,
                autocorrect: false,
                validator: (password) => password != null
                    ? (!password.isValidPassword() ? l10n.invalidEmail : null)
                    : null,
                onSaved: (newPassword) =>
                    passwordProvider.changePassword(newPassword!),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: l10n.passwordLabelText,
                  hintText: l10n.passwordHintText,
                  suffixIcon: IconButton(
                    onPressed: () => passwordHinter.toggleVisibility(),
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
          ),
          BlocListener<SignInCubit, SignInState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (_) {
                  appRouter.go(Routes.home.path);
                },
              );
            },
            child: Consumer2<EmailProvider, PasswordProvider>(
              builder: (_, emailProvider, passwordProvider, __) =>
                  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    150.w,
                    50.h,
                  ),
                ),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    await context.read<SignInCubit>().signIn(
                          SignInParams(
                            email: emailProvider.email!,
                            password: passwordProvider.password!,
                          ),
                        );
                  }
                },
                child: Text(l10n.signInButtonText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
