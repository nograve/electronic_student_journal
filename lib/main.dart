import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/app/my_app.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/locale_cubit.dart';
import 'package:electronic_student_journal/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencies();
  runApp(
    BlocProvider<LocaleCubit>(
      create: (context) => injector()..loadLocale(),
      child: MyApp(),
    ),
  );
}
