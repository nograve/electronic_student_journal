import 'package:electronic_student_journal/feature/home/presentation/views/home_view.dart';
import 'package:electronic_student_journal/gen/assets.gen.dart';
import 'package:electronic_student_journal/utils/helper/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
class AuthView extends StatefulWidget {
  ///
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formkey = GlobalKey<FormState>();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TODO(nograve): Put sign in button in form
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 16.h),
                        child: TextFormField(
                          validator: (email) => email != null
                              ? (!AuthHelper.isValidEmail(email)
                                  ? l10n.invalidEmail
                                  : null)
                              : null,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            labelText: l10n.emailLabelText,
                            hintText: l10n.emailHintText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: TextFormField(
                          validator: (password) => password != null
                              ? (!AuthHelper.isValidPassword(password)
                                  ? l10n.invalidEmail
                                  : null)
                              : null,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: l10n.passwordLabelText,
                            hintText: l10n.passwordHintText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      100.w,
                      50.h,
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    }
                  },
                  child: Text(l10n.logInButtonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
