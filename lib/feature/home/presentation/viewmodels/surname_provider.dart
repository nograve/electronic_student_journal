import 'package:flutter/material.dart';

class SurnameProvider extends ChangeNotifier {
  SurnameProvider({String? surname}) : _surname = surname;

  String? _surname;

  String? get surname => _surname;

  void changeSurname(String surname) {
    _surname = surname;
    notifyListeners();
  }
}
