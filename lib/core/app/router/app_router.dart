import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_confirmer_hinter.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_confirmer_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/home_view.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/sign_up_view.dart';
import 'package:electronic_student_journal/feature/settings/presentation/viewmodels/cubit/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/settings/presentation/views/settings_view.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/email_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_hinter.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/sign_in_cubit.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/views/sign_in_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum Routes {
  // splashScreen('/splashScreen'),
  home('/'),
  signIn('/sign_in'),
  signUp('/sign_up'),
  settings('/settings');

  const Routes(this.path);

  final String path;
}

final appRouter = GoRouter(
  routes: [
    // Home
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider<UserChangesBloc>(
            create: (_) => injector()..add(const UserChangesEvent.observe()),
          ),
          BlocProvider<GetUserDataCubit>(
            create: (context) => injector(),
          ),
        ],
        child: const HomeView(),
      ),
      routes: [
        // Sign Up
        GoRoute(
          path: 'sign_up',
          name: Routes.signUp.name,
          builder: (_, state) => BlocProvider.value(
            value: state.extra! as UserChangesBloc,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<EmailProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<PasswordProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<PasswordHinter>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<PasswordConfirmerProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<PasswordConfirmerHinter>(
                  create: (_) => injector(),
                ),
              ],
              child: SignUpView(
                userRole: state.queryParameters['userRole'],
              ),
            ),
          ),
        ),
        // Settings
        GoRoute(
          path: 'settings',
          name: Routes.settings.name,
          builder: (_, state) => BlocProvider.value(
            value: state.extra! as UserChangesBloc,
            child: BlocProvider<SignOutCubit>(
              create: (_) => injector(),
              child: const SettingsView(),
            ),
          ),
        ),
      ],
    ),
    // Sign In
    GoRoute(
      path: Routes.signIn.path,
      name: Routes.signIn.name,
      builder: (_, __) => MultiProvider(
        providers: [
          ChangeNotifierProvider<EmailProvider>(create: (_) => injector()),
          ChangeNotifierProvider<PasswordProvider>(create: (_) => injector()),
          ChangeNotifierProvider<PasswordHinter>(create: (_) => injector()),
        ],
        child: BlocProvider<SignInCubit>(
          create: (_) => injector(),
          child: const SignInView(),
        ),
      ),
    ),
  ],
);
