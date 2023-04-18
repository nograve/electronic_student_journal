// Copyright (c) 2022, Adryan Eka Vandra
// https://github.com/adryanev/flutter-electronic_student_journal-architecture-electronic_student_journal
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:electronic_student_journal/app/app.dart';
import 'package:electronic_student_journal/bootstrap.dart';
import 'package:electronic_student_journal/core/utils/constants.dart';

void main() {
  bootstrap(() => const App(), environment: Environment.staging);
}
