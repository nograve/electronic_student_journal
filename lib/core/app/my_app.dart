import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/core/theme/light_theme.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _logger = injector<Logger>();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              Locale? locale;

              state.whenOrNull(
                loaded: (loadedLocale) => locale = Locale(loadedLocale),
                saved: (savedLocale) => locale = Locale(savedLocale),
                failure: (message) {
                  _logger.w(message);
                },
              );

              _logger.w(locale);

              return MaterialApp.router(
                title: 'Electronic student journal',
                theme: lightTheme,
                locale: locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: appRouter,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context),
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
