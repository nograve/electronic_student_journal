import 'package:electronic_student_journal/features/counter/counter.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const home = 'counter';
  static const counter = 'counter';
}

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode || kProfileMode,
  routes: [
    GoRoute(
      path: '/',
      name: AppRouter.home,
      builder: (context, state) => const CounterPage(),
    )
  ],
);
