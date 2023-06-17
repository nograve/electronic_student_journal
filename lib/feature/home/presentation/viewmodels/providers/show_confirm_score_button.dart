import 'package:flutter/material.dart';

class ShowConfirmScoreButton extends ChangeNotifier {
  bool _isButtonShown = false;

  bool get isButtonShown => _isButtonShown;

  void showButton() {
    if (!_isButtonShown) {
      _isButtonShown = true;
      notifyListeners();
    }
  }

  void hideButton() {
    _isButtonShown = false;
    notifyListeners();
  }
}
