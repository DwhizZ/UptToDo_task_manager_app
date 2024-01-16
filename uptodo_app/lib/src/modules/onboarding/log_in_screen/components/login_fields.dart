import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/assets_paths.dart';
import '../../../../globals/widgets/onboarding/custom_log_in_button.dart';
import '../../../../globals/widgets/onboarding/onboard_header.dart';
import '../../../../globals/widgets/onboarding/or_divider.dart';
import '../provider/log_in_screen_provider.dart';
import 'custom_elevated_button.dart';
import 'onboarding_options.dart';
import 'text_field_with_header.dart';

class LogInFields extends StatelessWidget {
  const LogInFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.read<LogInScreenProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const OnboardHeader(onBoardHeader: 'Login'),
        TextFieldWithHeader(
          label: 'Username',
          controller: provider.userNameController,
          validator: provider.userNameValidator,
          hint: 'Enter your Username',
        ),
        TextFieldWithHeader(
          label: 'Password',
          controller: provider.passwordController,
          validator: provider.passwordValidator,
          hint: '*************',
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: CustomLogInButton(onPressed: () {}, buttonText: 'Login'),
        ),
        const OrDivider(),
        CustomElevatedButton(
            onPressed: () {},
            buttonText: 'Login with Google',
            iconPath: AssetsPaths.googleIcon),
        CustomElevatedButton(
            onPressed: () {},
            buttonText: 'Login with Apple',
            iconPath: AssetsPaths.appleIcon),
        OnboardingOptions(
          onPressed: provider.goToRegisterScreen,
          textQuestion: 'Don\'t have an account?',
          onboardText: 'Register',
        )
      ],
    );
  }
}


