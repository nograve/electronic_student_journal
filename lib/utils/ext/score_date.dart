import 'package:intl/intl.dart';

extension ScoreDate on DateTime {
  String scoreDateFormat() => DateFormat('dd/MM/yyyy').format(this);
}
