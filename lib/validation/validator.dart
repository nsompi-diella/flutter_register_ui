class Validator {
  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return '*required';
    }

    final regexUsername = RegExp('^[a-bA-Z]+');
    if (!regexUsername.hasMatch(value)) {
      return '*invalid username';
    }

    if (value.length < 3) {
      return '*too less character';
    }

    if (value.length > 15) {
      return '*too many character';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return '*required';
    }
    return null;
  }

  static String? confirmPassword(String? value, String confirmPassword) {
    if (value == null || value.isEmpty) {
      return '*required';
    }

    if (value != confirmPassword) {
      return 'Wrong Confirm password'; 
    }
    return null;
  }
}
