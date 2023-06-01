import 'package:flutter/material.dart';

class PatronymicProvider extends ChangeNotifier {
  PatronymicProvider({String? patronymic}) : _patronymic = patronymic;

  String? _patronymic;

  String? get patronymic => _patronymic;

  void changePatronymic(String patronymic) {
    _patronymic = patronymic;
    notifyListeners();
  }
}
