import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  NameProvider({String? name}) : _name = name;

  String? _name;

  String? get name => _name;

  void changeName(String name) {
    _name = name;
    notifyListeners();
  }
}
