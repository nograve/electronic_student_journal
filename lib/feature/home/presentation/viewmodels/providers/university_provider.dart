import 'package:flutter/material.dart';

class UniversityProvider extends ChangeNotifier {
  UniversityProvider({String? university}) : _university = university;

  String? _university;

  String? get university => _university;

  void changeUniversity(String university) {
    _university = university;
    notifyListeners();
  }
}
