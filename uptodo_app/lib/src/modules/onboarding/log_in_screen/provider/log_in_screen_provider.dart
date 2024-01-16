
import 'package:flutter/material.dart';

class LogInScreenProvider {
  LogInScreenProvider(this.context);
  BuildContext context;

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  String? userNameValidator(String? value) {
    if (value!.length <= 2 || value.isEmpty) {
      return "Username can't be this short";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 8) return "Password must be at least 8 characters long";

    return null;
  }

  bool get areFieldsValid {
    return userNameValidator(userNameController.text) == null &&
        passwordValidator(passwordController.text) == null;
  }

  void fieldValidate() {
    if (areFieldsValid) {
      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields correctly.'),
        ),
      );
    }
  }
}
