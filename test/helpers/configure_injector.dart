import 'package:electronic_student_journal/core/utils/constants.dart';
import 'package:electronic_student_journal/injector.dart';

Future<void> configureInjector() async {
  await configureDependencies(environment: Environment.test);
}
