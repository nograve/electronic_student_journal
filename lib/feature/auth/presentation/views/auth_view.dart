import 'package:electronic_student_journal/feature/auth/presentation/widgets/sign_in_form.dart';
import 'package:electronic_student_journal/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
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
                  image: Assets.images.logo.image().image,
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 2,
            child: SignInForm(),
          ),
        ],
      ),
    );
  }
}
