extension FormValidationExtension on String? {
  /// Password validation extension
  String? get isValidPassword {
    // 'this' refers to the String value itself
    if (this == null || this!.trim().isEmpty) {
      return "Please enter your password";
    }
    if (this!.length < 6) {
      return "Please enter at least 6 digit password";
    }

    return null;
  }

  /// You can easily add more validations here later!
  String? get isValidEmail {
    if (this == null || this!.trim().isEmpty) {
      return "Please enter your email address";
    }

    // Standard RFC 5322 compliant Email RegEx
    final emailRegEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegEx.hasMatch(this!)) {
      return "Please enter a valid email address";
    }

    return null;
  }
}

// note
// ^[a-zA-Z0-9...] ensures
//the email starts with valid characters
// (letters, numbers, or common symbols like dots and underscores).
// +@[a-zA-Z0-9]+ ensures
// there is exactly one @ symbol followed by
//the domain name (like gmail or yahoo).
// \.[a-zA-Z]+ ensures there is a dot followed
// by the domain extension (like .com or .org).
