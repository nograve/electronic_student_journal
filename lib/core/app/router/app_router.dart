import 'package:electronic_student_journal/feature/auth/data/datasources/firebase_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/auth/presentation/cubit/auth_cubit.dart';
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
      builder: (_, __) => const HomeView(),
    ),
    // Login
    GoRoute(
      path: Routes.login.path,
      name: Routes.login.name,
      builder: (_, __) => BlocProvider(
        create: (_) => AuthCubit(
          signInUseCase: SignInUseCase(
            AuthRepositoryImpl(FirebaseRemoteDataSourceImpl()),
          ),
        ),
        child: const AuthView(),
      ),
    ),
  ],
);
