import 'package:electronic_student_journal/feature/home/data/datasources/excel_local_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/excel_local_data_source_impl.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/firestore_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/firestore_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/register_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/register_remote_data_source_impl.dart';
import 'package:electronic_student_journal/feature/home/data/repositories/excel_repository_impl.dart';
import 'package:electronic_student_journal/feature/home/data/repositories/firestore_repository_impl.dart';
import 'package:electronic_student_journal/feature/home/data/repositories/register_repository_impl.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/excel_repository.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/locale_repository.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/locale_repository_impl.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/register_repository.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/delete_table_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/export_table_to_excel_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_locale_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_scores_tables_list_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_scores_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_changes_stream_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_data_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_users_data_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/register_user_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/set_locale_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/sign_out_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/update_access_time_usecase.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/delete_table_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/export_to_excel_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_scores_tables_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_users_data_cubit_dart_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/locale_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/register_user_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/sign_out_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/group_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/password_confirmer_hinter.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/password_confirmer_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/patronymic_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/role_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/scores_table_name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/surname_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/university_provider.dart';
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
    ..registerLazySingleton<ExcelLocalDataSource>(ExcelLocalDataSourceImpl.new)

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
    ..registerLazySingleton<ExcelRepository>(
      () => ExcelRepositoryImpl(excelLocalDataSource: injector()),
    )
    ..registerLazySingleton<LocaleRepository>(LocaleRepositoryImpl.new)

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
    ..registerLazySingleton(
      () => GetScoresUseCase(firestoreRepository: injector()),
    )
    ..registerLazySingleton(
      () => ExportTableToExcelUseCase(excelRepository: injector()),
    )
    ..registerLazySingleton(
      () => GetUsersDataUseCase(firestoreRepository: injector()),
    )
    ..registerLazySingleton(
      () => GetLocaleUseCase(localeRepository: injector()),
    )
    ..registerLazySingleton(
      () => SetLocaleUseCase(localeRepository: injector()),
    )
    ..registerLazySingleton(
      () => DeleteTableUseCase(firestoreRepository: injector()),
    )

    // Cubits
    ..registerFactory(() => SignInCubit(signInUseCase: injector()))
    ..registerFactory(() => SignOutCubit(signOutUseCase: injector()))
    ..registerFactory(() => GetUserDataCubit(getUserDataUsecase: injector()))
    ..registerFactory(() => RegisterUserCubit(registerUserUsecase: injector()))
    ..registerFactory(
      () => GetScoresTablesCubit(getScoresTablesUseCase: injector()),
    )
    ..registerFactory(() => GetScoresCubit(getScoresUseCase: injector()))
    ..registerFactory(
      () => ExportToExcelCubit(exportTableToExcelUseCase: injector()),
    )
    ..registerFactory(() => GetUsersDataCubit(getUsersDataUseCase: injector()))
    ..registerFactory(
      () => LocaleCubit(
        getLocaleUseCase: injector(),
        setLocaleUseCase: injector(),
      ),
    )
    ..registerFactory(() => DeleteTableCubit(deleteTableUseCase: injector()))

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
