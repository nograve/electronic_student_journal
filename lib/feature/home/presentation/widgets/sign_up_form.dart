import 'package:electronic_student_journal/core/app/router/app_router.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/group_controller.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/group_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/password_controller.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/patronymic_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/register_user_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/role_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/surname_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/university_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/group_form_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/name_form_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/password_confirmer_form_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/patronymic_form_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/role_form_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/surname_form_field.dart';
import 'package:electronic_student_journal/feature/home/presentation/widgets/university_form_field.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/email_form_field.dart';
import 'package:electronic_student_journal/feature/shared/presentation/widgets/password_form_field.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/email_provider.dart';
import 'package:electronic_student_journal/feature/sign_in/presentation/viewmodels/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  static final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: _formkey,
      child: PasswordController(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                ),
                child: const EmailFormField(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                ),
                child: const PasswordFormField(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12.h,
                ),
                child: const PasswordConfirmerFormField(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 24.h,
                ),
                child: const RoleFormField(),
              ),
              GroupController(
                child: Consumer<RoleProvider>(
                  builder: (_, roleProvider, __) {
                    if (roleProvider.role == null) {
                      return const SizedBox.shrink();
                    } else {
                      if (roleProvider.role == UserRole.student) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 24.h,
                              ),
                              child: const SurnameFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                              ),
                              child: const NameFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                              ),
                              child: const PatronymicFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                              ),
                              child: const UniversityFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                              ),
                              child: const GroupFormField(),
                            ),
                          ],
                        );
                      } else if (roleProvider.role == UserRole.teacher) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 24.h,
                              ),
                              child: const SurnameFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                              ),
                              child: const NameFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                              ),
                              child: const PatronymicFormField(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                              ),
                              child: const UniversityFormField(),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: BlocListener<RegisterUserCubit, RegisterUserState>(
                  listener: (_, state) {
                    state.whenOrNull(
                      success: () => appRouter.go(Routes.home.path),
                    );
                  },
                  child: Consumer6<
                      EmailProvider,
                      PasswordProvider,
                      RoleProvider,
                      NameProvider,
                      SurnameProvider,
                      UniversityProvider>(
                    builder: (
                      _,
                      emailProvider,
                      passwordProvider,
                      roleProvider,
                      nameProvider,
                      surnameProvider,
                      universityProvider,
                      __,
                    ) =>
                        Consumer2<GroupProvider, PatronymicProvider>(
                      builder: (_, groupProvider, patronymicProvider, __) =>
                          SizedBox(
                        width: 150.w,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();

                              context.read<RegisterUserCubit>().registerUser(
                                    UserEntity(
                                      // Uid will be assigned in register
                                      // remote data source
                                      uid: '',
                                      email: emailProvider.email!,
                                      role: roleProvider.role!,
                                      registeredAt: DateTime.now(),
                                      surname: surnameProvider.surname,
                                      name: nameProvider.name,
                                      patronymic: patronymicProvider.patronymic,
                                      university: universityProvider.university,
                                      group: groupProvider.group,
                                    ),
                                    passwordProvider.password!,
                                  );
                            }
                          },
                          child: Text(l10n.signUpUserButtonText),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
