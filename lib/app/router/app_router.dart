import 'package:electronic_student_journal/features/auth/presentation/views/auth_view.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const home = 'auth';
  static const auth = 'auth';
  static const register = 'register';
}

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode || kProfileMode,
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.auth,
      builder: (context, state) => const AuthView(),
    ),
  ],
);
