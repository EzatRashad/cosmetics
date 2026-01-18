class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$');
    if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 8 characters, include an uppercase letter and a number';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
