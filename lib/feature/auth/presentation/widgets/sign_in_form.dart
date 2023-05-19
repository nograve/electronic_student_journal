import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/auth/presentation/viewmodels/auth_cubit.dart';
import 'package:electronic_student_journal/feature/auth/presentation/viewmodels/password_hinter.dart';
import 'package:electronic_student_journal/utils/ext/auth_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formkey = GlobalKey<FormState>();
  String? _email;
  String? _password;

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
            child: TextFormField(
              validator: (email) => email != null
                  ? (!email.isValidEmail() ? l10n.invalidEmail : null)
                  : null,
              onSaved: (newEmail) => _email = newEmail,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: l10n.emailLabelText,
                hintText: l10n.emailHintText,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 24.h),
            child: Consumer<PasswordHinter>(
              builder: (_, passwordHinter, __) => TextFormField(
                obscureText: passwordHinter.isPasswordHinted,
                enableSuggestions: false,
                autocorrect: false,
                validator: (password) => password != null
                    ? (!password.isValidPassword() ? l10n.invalidEmail : null)
                    : null,
                onSaved: (newPassword) => _password = newPassword,
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
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (_) {
                  appRouter.go(Routes.home.path);
                },
              );
            },
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  150.w,
                  50.h,
                ),
              ),
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  await context.read<AuthCubit>().signIn(
                        SignInParams(
                          email: _email!,
                          password: _password!,
                        ),
                      );
                }
              },
              child: Text(l10n.signInButtonText),
            ),
          ),
        ],
      ),
    );
  }
}
