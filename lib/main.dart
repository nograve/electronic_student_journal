import 'package:electronic_student_journal/core/theme/theme_constants.dart';
import 'package:electronic_student_journal/feature/auth/data/datasources/firebase_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/post_sign_in.dart';
import 'package:electronic_student_journal/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:electronic_student_journal/feature/auth/presentation/views/auth_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // TODO(nograve): Add these sizes to constants.
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Electronic student journal',
          theme: lightTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        );
      },
      child: BlocProvider(
        create: (_) => AuthCubit(
          postSignIn:
              PostSignIn(AuthRepositoryImpl(FirebaseRemoteDataSourceImpl())),
        ),
        child: const AuthView(),
      ),
    );
  }
}
