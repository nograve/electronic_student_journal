import 'package:flutter/material.dart';

class PasswordHinter extends ChangeNotifier {
  bool _isPasswordHinted = true;

  bool get isPasswordHinted => _isPasswordHinted;

  void toggleVisibility() {
    _isPasswordHinted = !_isPasswordHinted;
    notifyListeners();
  }
}
