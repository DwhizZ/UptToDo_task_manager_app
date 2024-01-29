import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';

class LogInScreenProvider {
  LogInScreenProvider(this.context);
  BuildContext context;

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var password = TextEditingController();
  var password2 = TextEditingController();

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

  String? passwordValidator2(String? value) {
    if (value == null || value.isEmpty) {
      return "Password confirmation is required";
    }
    if (value != password.text) return "Passwords do not match";
    return null;
  }

  bool get areFieldsValid {
    return userNameValidator(userNameController.text) == null &&
        passwordValidator(passwordController.text) == null;
  }

  void fieldValidate() {
    if (areFieldsValid) {
      Navigator.pushNamed(context, RouteNames.indexHome);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields correctly.'),
        ),
      );
    }
  }

  void onArrow1pressed() {
    Navigator.pushNamed(context, RouteNames.onboardingIntro);
  }

  void onArrow2pressed() {
    Navigator.pushNamed(context, RouteNames.logInScreen);
  }

  void goToRegisterScreen() {
    Navigator.pushNamed(context, RouteNames.registerScreen);
  }
}
