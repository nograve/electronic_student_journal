import 'package:electronic_student_journal/app/router/app_router.dart';
import 'package:electronic_student_journal/core/extensions/context_extensions.dart';
import 'package:electronic_student_journal/core/utils/constants.dart';
import 'package:electronic_student_journal/injector.dart';
import 'package:electronic_student_journal/l10n/l10n.dart';
import 'package:electronic_student_journal/shared/flash/presentation/blocs/cubit/flash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FlashCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FlashCubit, FlashState>(
            listener: (context, state) {
              state.when(
                disappeared: () => null,
                appeared: (message) => context.showSnackbar(
                  message: message,
                ),
              );
            },
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(ScreenUtilSize.width, ScreenUtilSize.height),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              scaffoldMessengerKey: rootScaffoldMessengerKey,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
                colorScheme: ColorScheme.fromSwatch(
                  accentColor: const Color(0xFF13B9FF),
                ),
                fontFamily: GoogleFonts.poppins().fontFamily,
                // textTheme:
                //     Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: appRouter,
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.sp),
                  child: widget!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
