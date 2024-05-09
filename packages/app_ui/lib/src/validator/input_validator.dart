class TextInputValidator {
  String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailRegExp.hasMatch(value)) {
      return "Please enter a valid email";
    }

    return null;
  }

  String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    return null;
  }

  String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    if (password != value) {
      return "Passwords do not match";
    }

    return null;
  }

  String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    if (value.length != 10) {
      return "Please enter a valid 10-digit phone number";
    }

    return null;
  }

  String? validateBangladeshiPhoneNumber(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please enter a phone number';
    } else {
      // Remove whitespace and any non-numeric characters
      String phone = value!.replaceAll(RegExp(r'[^\d]'), '');

      // Check if the phone number is of valid length for Bangladeshi numbers
      if ((phone.length == 11 && phone.startsWith('01')) ||
          (phone.length == 13 && phone.startsWith('880'))) {
        return null; // Valid Bangladeshi phone number
      } else {
        return 'Please enter a valid Bangladeshi phone number';
      }
    }
  }

  String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    }

    return null;
  }

  String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return "This Field is Required";
    } else if (value.length > 50) {
      return "Name is too long";
    }

    return null;
  }

  String? isDateValid(String? input) {
    // Define the regex pattern for DD/MM/YYYY format
    if (input == null || input.isEmpty) return null;
    final RegExp dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])(?:/(19|20)\d\d)?$');

    // Check if the input matches the regex pattern
    return dateRegex.hasMatch(input) ? null : "Invalid date format";
  }
}
