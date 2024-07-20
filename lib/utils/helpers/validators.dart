class Validator {
  static String? isValidEmail(String? email) {
    if (email == null && email?.isEmpty == true) {
      return "Email can't be empty";
    } else if (email?.endsWith("@gmail.com") == false) {
      return "Enter a valid gmail";
    } else {
      return null;
    }
  }

  static String? isValidPassword(String? password) {
    if (password?.isEmpty == true || password == null) {
      return "Password can't be empty";
    } else if (!isAlphanumericPassword(password)) {
      return "Password must be alphanumeric";
    } else {
      return null;
    }
  }

  static bool isAlphanumericPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
