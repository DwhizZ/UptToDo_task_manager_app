mixin Validator {

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    //should be greater than 6 characters
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
