import 'package:flutter/foundation.dart';

class ShowStudentSearchProvider extends ChangeNotifier {
  ShowStudentSearchProvider({bool showStudentSearch = false})
      : _showStudentSearch = showStudentSearch;

  bool _showStudentSearch;

  bool get showStudentSearch => _showStudentSearch;

  void toggleVisibility() {
    _showStudentSearch = !_showStudentSearch;
    notifyListeners();
  }
}
