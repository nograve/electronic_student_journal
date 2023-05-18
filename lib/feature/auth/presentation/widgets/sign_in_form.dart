import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/auth/presentation/controllers/auth_cubit.dart';
import 'package:electronic_student_journal/utils/ext/auth_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Container(
            padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 16.h),
            decoration: const BoxDecoration(border: Border.symmetric()),
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
            padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 32.h),
            child: TextFormField(
              validator: (password) => password != null
                  ? (!password.isValidPassword() ? l10n.invalidEmail : null)
                  : null,
              onSaved: (newPassword) => _password = newPassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: l10n.passwordLabelText,
                hintText: l10n.passwordHintText,
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
                  100.w,
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
