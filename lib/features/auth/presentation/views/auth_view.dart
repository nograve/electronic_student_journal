import 'package:electronic_student_journal/core/presentation/mixins/failure_message_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends StatefulWidget with FailureMessageHandler {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

// TODO(nograve): Add i10n
class _AuthViewState extends State<AuthView> {
  final _formkey = GlobalKey<FormState>();

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 16.h),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Email',
                            hintText: 'Enter your email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            hintText: 'Enter your password',
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
                      // TODO(nograve): Navigate to next(home) view
                    }
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
