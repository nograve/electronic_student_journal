import 'package:electronic_student_journal/app/app.dart';
import 'package:electronic_student_journal/bootstrap.dart';
import 'package:electronic_student_journal/core/utils/constants.dart';

void main() {
  bootstrap(() => const App(), environment: Environment.staging);
}
