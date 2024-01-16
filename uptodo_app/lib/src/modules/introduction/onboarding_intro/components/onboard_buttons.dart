import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/globals/providers/introduction_provider.dart';

import 'custom_create_acct_button.dart';
import '../../../../globals/widgets/onboarding/custom_log_in_button.dart';

class OnboardButtons extends StatelessWidget {
  const OnboardButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.read<IntroductionProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 370),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomLogInButton(buttonText: 'LOGIN', onPressed: provider.goToLogInScreen),
          CustomCreateAcctButton(onPressed: provider.goToRegisterScreen),
        ],
      ),
    );
  }
}
