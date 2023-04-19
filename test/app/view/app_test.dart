import 'package:electronic_student_journal/app/app.dart';
import 'package:electronic_student_journal/features/auth/presentation/views/auth_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/helpers.dart';

void main() {
  setUpAll(() async {
    await configureInjector();
  });

  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);
  group('App', () {
    testWidgets('renders AuthView', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(AuthView), findsOneWidget);
    });
  });
}
