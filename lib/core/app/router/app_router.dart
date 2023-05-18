import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/auth/presentation/controllers/auth_cubit.dart';
import 'package:electronic_student_journal/feature/auth/presentation/views/auth_view.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  // splashScreen('/splashScreen'),
  home('/'),
  login('/auth/login'),
  ;

  const Routes(this.path);

  final String path;
}

final appRouter = GoRouter(
  routes: [
    // Home
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (_, __) => BlocProvider<AuthCubit>(
        create: (_) => injector()..isSignedIn(NoParams()),
        child: const HomeView(),
      ),
    ),
    // Login
    GoRoute(
      path: Routes.login.path,
      name: Routes.login.name,
      builder: (_, __) => BlocProvider<AuthCubit>(
        create: (_) => injector(),
        child: const AuthView(),
      ),
    ),
  ],
);
