import 'package:electronic_student_journal/feature/home/data/datasources/firestore_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/firestore_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/register_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/register_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/home/data/repositories/firestore_repository_impl.dart';
import 'package:electronic_student_journal/feature/home/data/repositories/register_repository_impl.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/register_repository.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_scores_tables_list_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_changes_stream_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_data_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/register_user_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/sign_out_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/update_access_time_usecase.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_scores_tables_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/group_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_confirmer_hinter.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_confirmer_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/patronymic_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/register_user_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/role_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/scores_table_name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/surname_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/university_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:electronic_student_journal/feature/shared/data/datasources/firebase_auth_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/shared/data/repositories/auth_repository_impl.dart';
import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/feature/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/email_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_hinter.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
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
    ..registerLazySingleton<RegisterRemoteDataSource>(
      RegisterRemoteDataSourceImpl.new,
    )
    ..registerLazySingleton<FirestoreRemoteDataSource>(
      FirestoreRemoteDataSourceImpl.new,
    )

    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseRemoteDataSource: injector()),
    )
    ..registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDataSource: injector()),
    )
    ..registerLazySingleton<FirestoreRepository>(
      () => FirestoreRepositoryImpl(firestoreRemoteDataSource: injector()),
    )

    // Usecases
    ..registerLazySingleton(() => SignInUseCase(authRepository: injector()))
    ..registerLazySingleton(() => SignOutUseCase(authRepository: injector()))
    ..registerLazySingleton(
      () => GetUserChangesStreamUseCase(authRepository: injector()),
    )
    ..registerLazySingleton(
      () => GetUserDataUsecase(firestoreRepository: injector()),
    )
    ..registerLazySingleton(
      () => RegisterUserUsecase(registerRepository: injector()),
    )
    ..registerLazySingleton(
      () => UpdateAccessTimeUseCase(firestoreRepository: injector()),
    )
    ..registerLazySingleton(
      () => GetScoresTablesUseCase(firestoreRepository: injector()),
    )

    // Cubits
    ..registerFactory(() => SignInCubit(signInUseCase: injector()))
    ..registerFactory(() => SignOutCubit(signOutUseCase: injector()))
    ..registerFactory(() => GetUserDataCubit(getUserDataUsecase: injector()))
    ..registerFactory(() => RegisterUserCubit(registerUserUsecase: injector()))
    ..registerFactory(
      () => GetScoresTablesCubit(getScoresTablesUseCase: injector()),
    )

    // BLoCs
    ..registerFactory(
      () => UserChangesBloc(
        getUserChangesStreamUseCase: injector(),
        updateAccessTimeUseCase: injector(),
      ),
    )

    // Providers
    ..registerFactory(EmailProvider.new)
    ..registerFactory(PasswordProvider.new)
    ..registerFactory(PasswordHinter.new)
    ..registerFactory(PasswordConfirmerProvider.new)
    ..registerFactory(PasswordConfirmerHinter.new)
    ..registerFactory(RoleProvider.new)
    ..registerFactory(SurnameProvider.new)
    ..registerFactory(NameProvider.new)
    ..registerFactory(PatronymicProvider.new)
    ..registerFactory(UniversityProvider.new)
    ..registerFactory(GroupProvider.new)
    ..registerFactory(ScoresTableNameProvider.new)

    // Logger
    ..registerLazySingleton(Logger.new);
}
