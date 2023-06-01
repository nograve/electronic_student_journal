import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_controller.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/register_user_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/password_confirmer_form_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/role_form_field.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/email_form_field.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/password_form_field.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/email_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  static final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: PasswordController(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                top: 32.h,
                right: 12.w,
              ),
              child: const EmailFormField(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                top: 24.h,
                right: 12.w,
              ),
              child: const PasswordFormField(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                top: 24.h,
                right: 12.w,
              ),
              child: const PasswordConfirmerFormField(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                top: 24.h,
                right: 12.w,
              ),
              child: const RoleFormField(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: BlocListener<RegisterUserCubit, RegisterUserState>(
                listener: (_, state) {
                  state.whenOrNull(
                    success: () => appRouter.go(Routes.home.path),
                  );
                },
                child: Consumer2<EmailProvider, PasswordProvider>(
                  builder: (context, emailProvider, passwordProvider, child) =>
                      SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          context.read<RegisterUserCubit>().registerUser(
                                emailProvider.email!,
                                passwordProvider.password!,
                              );
                        }
                      },
                      child: const Text('Sign up user'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
