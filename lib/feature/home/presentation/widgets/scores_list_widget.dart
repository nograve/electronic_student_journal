import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/get_user_data_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/cubits/scores_cubit.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/score_name_provider.dart';
import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/show_confirm_score_button.dart';
import 'package:electronic_student_journal/utils/ext/score_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ScoresListWidget extends StatelessWidget {
  const ScoresListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreNameProvider>(
      builder: (_, scoreNameProvider, __) =>
          BlocBuilder<ScoresCubit, ScoresState>(
        builder: (context, state) {
          final scores = state.scores
              .where(
                (score) =>
                    score.date.scoreDateFormat() == scoreNameProvider.scoreName,
              )
              .toList();

          return Column(
            children: [
              ...scores.map(
                (score) => ChangeNotifierProvider<ShowConfirmScoreButton>(
                  create: (context) => injector(),
                  child: BlocProvider<GetUserDataCubit>(
                    create: (context) => injector()
                      ..getUserData(
                        score.studentUid,
                      ),
                    child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          success: (student) {
                            final scoreController = TextEditingController(
                              text: !score.score.isNegative
                                  ? score.score.toString()
                                  : '',
                            );

                            final initialScore = score;

                            return Padding(
                              padding: EdgeInsets.only(
                                left: 8.w,
                                top: 8.h,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    student.fullNameWithInitials,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8.w,
                                    ),
                                    child: SizedBox(
                                      width: 75.w,
                                      height: 50.h,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                            3,
                                          )
                                        ],
                                        controller: scoreController,
                                        onChanged: (_) => context
                                            .read<ShowConfirmScoreButton>()
                                            .showButton(),
                                      ),
                                    ),
                                  ),
                                  Consumer<ShowConfirmScoreButton>(
                                    builder: (_, showConfirmScoreButton, __) =>
                                        showConfirmScoreButton.isButtonShown
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.w),
                                                child: SizedBox(
                                                  width: 50.w,
                                                  height: 50.h,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              ShowConfirmScoreButton>()
                                                          .hideButton();
                                                      context
                                                          .read<ScoresCubit>()
                                                          .changeScore(
                                                            initialScore:
                                                                initialScore,
                                                            score: initialScore
                                                                .toModel()
                                                                .copyWith(
                                                                  score:
                                                                      int.tryParse(
                                                                            scoreController.text,
                                                                          ) ??
                                                                          -1,
                                                                )
                                                                .toEntity(),
                                                          );
                                                    },
                                                    child: Icon(
                                                      Icons.done,
                                                      size: 18.sp,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                  )
                                ],
                              ),
                            );
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          orElse: SizedBox.shrink,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
