import 'package:electronic_student_journal/feature/home/presentation/widgets/password_confirmer_form_field.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/email_form_field.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  static final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
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
            padding: EdgeInsets.only(top: 16.h),
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();

                  print('validates!');
                }
                print('not validates!');
              },
              child: const Text('Sign up user'),
            ),
          ),
        ],
      ),
    );
  }
}
