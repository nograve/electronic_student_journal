import 'package:flutter/foundation.dart';

class EmailProvider extends ChangeNotifier {
  EmailProvider({String? email}) : _email = email;

  String? _email;

  String? get email => _email;

  void changeEmail(String email) {
    _email = email;
    notifyListeners();
  }
}
