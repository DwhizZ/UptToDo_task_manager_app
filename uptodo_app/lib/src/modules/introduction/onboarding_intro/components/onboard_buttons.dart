import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/modules/authentication/provider/auth_provider.dart';
import 'custom_create_acct_button.dart';
import '../../../../globals/widgets/onboarding/custom_log_in_button.dart';

class OnboardButtons extends StatelessWidget {
  const OnboardButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomLogInButton(
            buttonText: 'LOGIN',
            onPressed: () async {
              final auth = context.read<AuthenticationProvider>();
              if (await auth.isAuthenticated()) {
                if (context.mounted) {
                  Navigator.pushNamed(context, RouteNames.indexHome);
                }
              } else {
                if (context.mounted) {
                  Navigator.pushNamed(context, RouteNames.logInScreen);
                }
              }
            }),
        CustomCreateAcctButton(
          onPressed: () =>
              Navigator.pushNamed(context, RouteNames.registerScreen),
        ),
      ],
    );
  }
}
