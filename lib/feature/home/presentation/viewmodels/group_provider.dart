import 'package:flutter/material.dart';

class GroupProvider extends ChangeNotifier {
  GroupProvider({String? group}) : _group = group;

  String? _group;

  String? get group => _group;

  void changeGroup(String group) {
    _group = group;
    notifyListeners();
  }
}
