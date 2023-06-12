import 'package:flutter/foundation.dart';

class PasswordConfirmerHinter extends ChangeNotifier {
  bool _isPasswordHinted = true;

  bool get isPasswordHinted => _isPasswordHinted;

  void toggleVisibility() {
    _isPasswordHinted = !_isPasswordHinted;
    notifyListeners();
  }
}
