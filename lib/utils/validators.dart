class Validators {
  static String? validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email) || email.trim().isEmpty) {
      return "This email is not invalid.";
    }

    if (email.trim().isEmpty) {
      return 'This field needs to be filled in.';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.trim().isEmpty) {
      return 'This field needs to be filled in.';
    }
    if (password.length < 8) {
      return "This password is not invalid.";
    }
    return null;
  }

  static String? passwordsMatch(String firstPassword, String secondPassword) {
    if (firstPassword != secondPassword) {
      return "passwords do not match.";
    } else if (validatePassword(secondPassword) != null) {
      return validatePassword(secondPassword);
    }
    return null;
  }
}
