import 'package:electronic_student_journal/feature/auth/domain/usecases/post_sign_in.dart';
import 'package:electronic_student_journal/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/home_view.dart';
import 'package:electronic_student_journal/gen/assets.gen.dart';
import 'package:electronic_student_journal/utils/ext/auth_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formkey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Container(
              width: 250.h,
              height: 250.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // TODO(nograve): Make image trasnparent
                  image: Assets.images.logo.image().image,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 16.h),
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
                          ? (!password.isValidPassword()
                              ? l10n.invalidEmail
                              : null)
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
                        success: (_) => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const HomeView(),
                          ),
                        ),
                      );
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          100.w,
                          50.h,
                        ),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          context.read<AuthCubit>().signIn(
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
            ),
          ),
        ],
      ),
    );
  }
}
