import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/params/locale_params.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/blocs/user_changes_bloc.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/locale_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<UserChangesBloc, UserChangesState>(
      listener: (_, state) {
        state.whenOrNull(
          userSingsOut: () => appRouter.go(Routes.signIn.path),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.settings),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.language,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: BlocBuilder<LocaleCubit, LocaleState>(
                    builder: (context, state) {
                      final locale = state.maybeWhen(
                        loaded: Locale.new,
                        saved: Locale.new,
                        orElse: () => Localizations.localeOf(context),
                      );

                      final String? localeValue;
                      if (locale.languageCode == 'uk') {
                        localeValue = l10n.uaLang;
                      } else if (locale.languageCode == 'en') {
                        localeValue = l10n.enLang;
                      } else {
                        localeValue = null;
                      }

                      return DropdownButton<String>(
                        value: localeValue,
                        items: <String>[l10n.uaLang, l10n.enLang]
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (newLocaleValue) {
                          final String? localeLang;
                          if (newLocaleValue == l10n.uaLang) {
                            localeLang = 'uk';
                          } else if (newLocaleValue == l10n.enLang) {
                            localeLang = 'en';
                          } else {
                            localeLang = null;
                          }

                          if (localeLang != null) {
                            context
                                .read<LocaleCubit>()
                                .saveLocale(LocaleParams(locale: localeLang));
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  toast('Signed out');
                  context.read<SignOutCubit>().signOut();
                },
                child: Text(l10n.signOutButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
