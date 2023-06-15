import 'package:flutter/material.dart';

class ScoreNameProvider extends ChangeNotifier {
  ScoreNameProvider({String? scoreName}) : _scoreName = scoreName;

  String? _scoreName;

  String? get scoreName => _scoreName;

  void changeScoreName(String scoreName) {
    _scoreName = scoreName;
    notifyListeners();
  }
}
