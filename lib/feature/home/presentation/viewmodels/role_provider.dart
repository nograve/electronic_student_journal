import 'package:flutter/material.dart';

class RoleProvider extends ChangeNotifier {
  RoleProvider({String? role}) : _role = role;

  String? _role;

  String? get role => _role;

  void changeRole(String role) {
    _role = role;
    notifyListeners();
  }
}
