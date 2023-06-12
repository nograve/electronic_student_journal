import 'package:flutter/material.dart';

class ScoresTableNameProvider extends ChangeNotifier {
  ScoresTableNameProvider({String? tableName}) : _tableName = tableName;

  String? _tableName;

  String? get tableName => _tableName;

  void changeScoresTableName(String tableName) {
    _tableName = tableName;
    notifyListeners();
  }
}
