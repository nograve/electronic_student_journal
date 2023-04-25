///
class AuthHelper {
  AuthHelper._();

  ///
  static bool isValidEmail(String email) => email.contains(
        RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        ),
      );

  ///
  static bool isValidPassword(String password) => password.length > 6;
}
