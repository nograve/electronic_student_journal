import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/export_to_excel_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/get_scores_cubit.dart';
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
import 'package:electronic_student_journal/feature/home/presentation/views/edit_scores_table_view.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/home_view.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/scores_table_view.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/scores_view.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/settings_view.dart';
import 'package:electronic_student_journal/feature/home/presentation/views/sign_up_view.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/email_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_hinter.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/sign_in_cubit.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/views/sign_in_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum Routes {
  home('/'),
  signIn('/sign_in'),
  scores('/scores'),
  scoresTable('/scores/scoresTable'),
  editScoresTable('/scores/editScoresTable'),
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
            create: (_) => injector(),
          ),
          BlocProvider<SignOutCubit>(
            create: (_) => injector(),
          ),
        ],
        child: const HomeView(),
      ),
      routes: [
        // Sign Up
        GoRoute(
          path: 'sign_up',
          name: Routes.signUp.name,
          builder: (_, state) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: state.extra! as UserChangesBloc,
              ),
              BlocProvider<RegisterUserCubit>(
                create: (context) => injector(),
              ),
            ],
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
                ChangeNotifierProvider<RoleProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<SurnameProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<NameProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<PatronymicProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<UniversityProvider>(
                  create: (_) => injector(),
                ),
                ChangeNotifierProvider<GroupProvider>(
                  create: (_) => injector(),
                ),
              ],
              child: SignUpView(
                userRole: state.queryParameters['userRole'],
              ),
            ),
          ),
        ),
        // Scores
        GoRoute(
          path: 'scores',
          name: Routes.scores.name,
          builder: (_, state) {
            final extra = state.extra! as (UserChangesBloc, ScoresTableEntity?);

            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: extra.$1,
                ),
                BlocProvider<GetScoresTablesCubit>(
                  create: (_) => injector(),
                ),
                BlocProvider<GetUserDataCubit>(create: (_) => injector()),
              ],
              child: const ScoresView(),
            );
          },
          // Scores Table
          routes: [
            GoRoute(
              path: 'scoresTable',
              name: Routes.scoresTable.name,
              builder: (_, state) {
                final extra =
                    state.extra! as (UserChangesBloc, ScoresTableEntity);

                return BlocProvider.value(
                  value: extra.$1,
                  child: BlocProvider<GetScoresCubit>(
                    create: (_) => injector()..getScores(extra.$2.uid),
                    child: BlocProvider<GetUserDataCubit>(
                      create: (_) => injector(),
                      child: BlocProvider<ExportToExcelCubit>(
                        create: (_) => injector(),
                        child: ScoresTableView(
                          userRole: state.queryParameters['userRole']!,
                          table: extra.$2,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            // Edit scores table
            GoRoute(
              path: 'editScoresTable',
              name: Routes.editScoresTable.name,
              builder: (context, state) => BlocProvider.value(
                value: state.extra! as UserChangesBloc,
                child: BlocProvider<GetUserDataCubit>(
                  create: (_) => injector(),
                  child: ChangeNotifierProvider<ScoresTableNameProvider>(
                    create: (_) => injector(),
                    child: const EditScoresTableView(),
                  ),
                ),
              ),
            ),
          ],
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
