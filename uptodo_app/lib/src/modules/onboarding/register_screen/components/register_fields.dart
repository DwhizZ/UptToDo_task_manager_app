
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/assets_paths.dart';
import '../../../../globals/widgets/onboarding/custom_log_in_button.dart';
import '../../../../globals/widgets/onboarding/onboard_header.dart';
import '../../../../globals/widgets/onboarding/or_divider.dart';
import '../../log_in_screen/components/custom_elevated_button.dart';
import '../../log_in_screen/components/onboarding_options.dart';
import '../../log_in_screen/components/text_field_with_header.dart';
import '../../log_in_screen/provider/log_in_screen_provider.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    super.key,
 
  });

  

  @override
  Widget build(BuildContext context) {
        var provider = context.read<LogInScreenProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const OnboardHeader(onBoardHeader: 'Register'),
        TextFieldWithHeader(
            label: 'Username',
            controller: provider.userNameController,
            validator: provider.userNameValidator,
            hint: 'Enter your Username'),
        TextFieldWithHeader(
            label: 'Password',
            controller: provider.password,
            validator: provider.passwordValidator,
            hint: '************',
            obscureText: true),
        TextFieldWithHeader(
            label: 'Confirm Password',
            controller: provider.password2,
            validator: provider.passwordValidator2,
            hint: '************',
            obscureText: true),
        CustomLogInButton(onPressed: () {}, buttonText: 'Register'),
        const OrDivider(),
        CustomElevatedButton(
            onPressed: () {},
            buttonText: 'Register with Google',
            iconPath: AssetsPaths.googleIcon),
        CustomElevatedButton(
            onPressed: () {},
            buttonText: 'Register with Apple',
            iconPath: AssetsPaths.appleIcon),
        OnboardingOptions(
            onPressed: provider.onArrow2pressed,
            textQuestion: 'Alraedy have an account?',
            onboardText: 'Login'),
      ],
    );
  }
}
