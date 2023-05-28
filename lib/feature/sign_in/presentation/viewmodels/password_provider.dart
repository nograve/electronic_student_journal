import 'package:flutter/foundation.dart';

class PasswordProvider extends ChangeNotifier {
  PasswordProvider({String? password}) : _password = password;

  String? _password;

  String? get password => _password;

  void changePassword(String password) {
    _password = password;
    notifyListeners();
  }
}
