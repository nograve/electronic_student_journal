import 'package:electronic_student_journal/core/domain/failures/failure.codegen.dart';
import 'package:electronic_student_journal/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
// import 'package:electronic_student_journal/l10n/l10n.dart';

mixin FailureMessageHandler {
  void handleFailure(BuildContext context, Failure failure) {
    // final l10n = context.l10n;
    failure.when(
      localFailure: (message) => context.displayFlash(message),
      serverFailure: (message) => context.displayFlash(message),
    );
  }
}
