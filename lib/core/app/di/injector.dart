import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_changes_stream_usecase.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/settings/domain/usecases/sign_out_usecase.dart';
import 'package:electronic_student_journal/feature/settings/presentation/viewmodels/cubit/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/shared/data/repositories/auth_repository_impl.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/feature/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_hinter.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final injector = GetIt.instance;

void initDependencies() {
  // Data sources
  injector
    ..registerLazySingleton<FirebaseAuthRemoteDataSource>(
      FirebaseAuthRemoteDataSourceImpl.new,
    )

    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseRemoteDataSource: injector()),
    )

    // Usecases
    ..registerLazySingleton(() => SignInUseCase(authRepository: injector()))
    ..registerLazySingleton(() => SignOutUseCase(authRepository: injector()))
    ..registerLazySingleton(
      () => GetUserChangesStreamUseCase(authRepository: injector()),
    )

    // Cubits
    ..registerFactory(() => SignInCubit(signInUseCase: injector()))
    ..registerFactory(() => SignOutCubit(signOutUseCase: injector()))

    // BLoCs
    ..registerFactory(
      () => UserChangesBloc(getUserChangesStreamUseCase: injector()),
    )

    // Providers
    ..registerFactory(PasswordHinter.new)

    // Logger
    ..registerLazySingleton(Logger.new);
}
