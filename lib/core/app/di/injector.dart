import 'package:electronic_student_journal/feature/auth/data/datasources/firebase_remote_data_source.dart';
import 'package:electronic_student_journal/feature/auth/data/datasources/firebase_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:electronic_student_journal/feature/auth/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:electronic_student_journal/feature/auth/presentation/controllers/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initDependencies() {
  // Data sources
  injector
    ..registerLazySingleton<FirebaseRemoteDataSource>(
      FirebaseRemoteDataSourceImpl.new,
    )

    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(injector()),
    )

    // Usecases
    ..registerLazySingleton(() => SignInUseCase(injector()))
    ..registerLazySingleton(() => SignOutUseCase(injector()))
    ..registerLazySingleton(() => IsSignedInUsecase(injector()))

    // Cubits
    ..registerFactory(
      () => AuthCubit(
        signInUseCase: injector(),
        isSignedInUsecase: injector(),
        signOutUseCase: injector(),
      ),
    );
}
