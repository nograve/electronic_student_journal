import 'package:electronic_student_journal/feature/sign_in/presentation/widgets/sign_in_form.dart';
import 'package:electronic_student_journal/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 120.h,
                bottom: 100.h,
              ),
              child: Container(
                width: 250.h,
                height: 250.h,
                decoration: BoxDecoration(
                  border: const Border.fromBorderSide(BorderSide()),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                    image: Assets.images.logo.image().image,
                  ),
                ),
              ),
            ),
            SignInForm(),
          ],
        ),
      ),
    );
  }
}
