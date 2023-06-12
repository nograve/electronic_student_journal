import 'package:flutter/foundation.dart';

class PasswordConfirmerProvider extends ChangeNotifier {
  PasswordConfirmerProvider({String? confirmedPassword})
      : _confirmedPassword = confirmedPassword;

  String? _confirmedPassword;

  String? get confirmedPassword => _confirmedPassword;

  void changeConfirmedPassword(String password) {
    _confirmedPassword = password;
    notifyListeners();
  }
}
